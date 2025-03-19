import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';

class SignupController extends GetxController {
  TextEditingController fullname = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobilenumber = TextEditingController();
  TextEditingController dateofbirth = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;
  final DatabaseReference database = FirebaseDatabase.instance.ref();

  var isLoading = false.obs;
  var fullnameError = ''.obs;
  var emailError = ''.obs;
  var passwordError = ''.obs;
  var mobileError = ''.obs;
  var dobError = ''.obs;
  var successMessage = ''.obs;
  var isPasswordHidden = true.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void clearFields() {
    fullname.clear();
    password.clear();
    email.clear();
    mobilenumber.clear();
    dateofbirth.clear();
    fullnameError.value = '';
    emailError.value = '';
    passwordError.value = '';
    mobileError.value = '';
    dobError.value = '';
    successMessage.value = '';
  }

  void signUp() async {
    fullnameError.value = '';
    emailError.value = '';
    passwordError.value = '';
    mobileError.value = '';
    dobError.value = '';

    bool hasError = false;
    if (fullname.text.isEmpty) {
      fullnameError.value = 'Vui lòng nhập họ tên';
      hasError = true;
    }
    if (email.text.isEmpty) {
      emailError.value = 'Vui lòng nhập email';
      hasError = true;
    } else if (!GetUtils.isEmail(email.text)) {
      emailError.value = 'Email không hợp lệ';
      hasError = true;
    }
    if (password.text.isEmpty) {
      passwordError.value = 'Vui lòng nhập mật khẩu';
      hasError = true;
    } else if (password.text.length < 6) {
      passwordError.value = 'Mật khẩu phải có ít nhất 6 ký tự';
      hasError = true;
    }
    if (mobilenumber.text.isEmpty) {
      mobileError.value = 'Vui lòng nhập số điện thoại';
      hasError = true;
    }
    if (dateofbirth.text.isEmpty) {
      dobError.value = 'Vui lòng nhập ngày sinh';
      hasError = true;
    }

    if (hasError) return;

    try {
      isLoading.value = true;

      // Tạo tài khoản Authentication
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email.text, password: password.text);

      // Lưu thông tin vào Realtime Database sau khi đăng ký thành công
      await saveUserProfile(userCredential.user!.uid);

      successMessage.value = 'Đăng ký thành công';
      Get.snackbar(
        "Thành công",
        successMessage.value,
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.TOP,
      );

      clearFields();
      Get.offAllNamed('/login');
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        passwordError.value = 'Mật khẩu quá yếu (tối thiểu 6 ký tự)';
      } else if (ex.code == 'email-already-in-use') {
        emailError.value = 'Email đã được sử dụng';
      } else {
        Get.snackbar("Lỗi", "Lỗi: ${ex.message}",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.redAccent);
      }
    } catch (ex) {
      Get.snackbar("Lỗi", "Đã xảy ra lỗi, vui lòng thử lại!",
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.redAccent);
      print("Lỗi không xác định: $ex");
    } finally {
      isLoading.value = false;
    }
  }

  // Hàm lưu thông tin người dùng lên Realtime Database
  Future<void> saveUserProfile(String uid) async {
    try {
      Map<String, dynamic> userData = {
        'fullname': fullname.text,
        'email': email.text,
        'mobilenumber': mobilenumber.text,
        'dateofbirth': dateofbirth.text,
        'createdAt': ServerValue.timestamp,
      };

      // Sử dụng set với một giá trị cụ thể để tránh lỗi null
      await database.child('users').child(uid).set(userData);
      print("Đã lưu dữ liệu người dùng thành công");
    } catch (e) {
      print("Lỗi khi lưu thông tin: $e");
      Get.snackbar("Lỗi", "Không thể lưu thông tin: $e",
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.redAccent);
      throw e; // Ném lỗi để hàm gọi có thể bắt được
    }
  }

  // Hàm cập nhật thông tin profile lên Realtime Database
  Future<void> updateUserProfile() async {
    try {
      User? user = auth.currentUser;
      if (user != null) {
        isLoading.value = true;
        await database.child('users').child(user.uid).update({
          'fullname': fullname.text,
          'email': email.text,
          'mobilenumber': mobilenumber.text,
          'dateofbirth': dateofbirth.text,
          'updatedAt': ServerValue.timestamp,
        });

        // Cập nhật email trong Firebase Authentication nếu thay đổi
        if (email.text != user.email) {
          await user.updateEmail(email.text);
        }

        Get.snackbar(
          "Thành công",
          "Thông tin đã được cập nhật!",
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      print("Lỗi khi cập nhật thông tin: $e");
      Get.snackbar("Lỗi", "Không thể cập nhật thông tin: $e",
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.redAccent);
    } finally {
      isLoading.value = false;
    }
  }

  // Hàm tải thông tin profile từ Realtime Database
  Future<void> loadUserProfile() async {
    try {
      User? user = auth.currentUser;
      if (user != null) {
        DatabaseEvent event =
            await database.child('users').child(user.uid).once();
        if (event.snapshot.exists) {
          Map<dynamic, dynamic> data =
              event.snapshot.value as Map<dynamic, dynamic>;
          fullname.text = data['fullname'] ?? '';
          email.text = data['email'] ?? '';
          mobilenumber.text = data['mobilenumber'] ?? '';
          dateofbirth.text = data['dateofbirth'] ?? '';
        }
      }
    } catch (e) {
      print("Lỗi khi tải thông tin: $e");
      Get.snackbar("Lỗi", "Không thể tải thông tin: $e",
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.redAccent);
    }
  }

  @override
  void onClose() {
    fullname.dispose();
    password.dispose();
    email.dispose();
    mobilenumber.dispose();
    dateofbirth.dispose();
    super.onClose();
  }
}
