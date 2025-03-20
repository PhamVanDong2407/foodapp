import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';

class SignupController extends GetxController {
  // Các TextEditingController để quản lý input từ người dùng
  TextEditingController fullname = TextEditingController(); // Họ và tên
  TextEditingController password = TextEditingController(); // Mật khẩu
  TextEditingController email = TextEditingController(); // Email
  TextEditingController mobilenumber = TextEditingController(); // Số điện thoại
  TextEditingController dateofbirth = TextEditingController(); // Ngày sinh
  TextEditingController addressLabel = TextEditingController(); // Nhãn địa chỉ (VD: Nhà riêng)
  TextEditingController addressDetails = TextEditingController(); // Chi tiết địa chỉ

  final FirebaseAuth auth = FirebaseAuth.instance; // Instance của Firebase Auth
  final DatabaseReference database = FirebaseDatabase.instance.ref(); // Reference tới Realtime Database

  // Các biến trạng thái
  var isLoading = false.obs; // Trạng thái loading
  var fullnameError = ''.obs; // Lỗi họ và tên
  var emailError = ''.obs; // Lỗi email
  var passwordError = ''.obs; // Lỗi mật khẩu
  var mobileError = ''.obs; // Lỗi số điện thoại
  var dobError = ''.obs; // Lỗi ngày sinh
  var successMessage = ''.obs; // Thông báo thành công
  var isPasswordHidden = true.obs; // Trạng thái ẩn/hiện mật khẩu
  var addresses = <Map<dynamic, dynamic>>[].obs; // Danh sách địa chỉ

  @override
  void onInit() {
    super.onInit();
    loadAddresses(); // Tải danh sách địa chỉ khi khởi tạo controller
  }

  // Hàm để ẩn/hiện mật khẩu
  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  // Hàm để xóa các trường nhập liệu
  void clearFields() {
    fullname.clear();
    password.clear();
    email.clear();
    mobilenumber.clear();
    dateofbirth.clear();
    addressLabel.clear();
    addressDetails.clear();
    fullnameError.value = '';
    emailError.value = '';
    passwordError.value = '';
    mobileError.value = '';
    dobError.value = '';
    successMessage.value = '';
  }

  // Hàm đăng ký tài khoản
  void signUp() async {
    // Xóa các lỗi trước đó
    fullnameError.value = '';
    emailError.value = '';
    passwordError.value = '';
    mobileError.value = '';
    dobError.value = '';

    bool hasError = false;
    // Kiểm tra các trường nhập liệu
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

      // Tạo tài khoản trên Firebase Authentication
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email.text, password: password.text);

      // Lưu thông tin người dùng vào Realtime Database
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
    } finally {
      isLoading.value = false;
    }
  }

  // Hàm lưu thông tin người dùng vào Realtime Database
  Future<void> saveUserProfile(String uid) async {
    try {
      Map<String, dynamic> userData = {
        'fullname': fullname.text,
        'email': email.text,
        'mobilenumber': mobilenumber.text,
        'dateofbirth': dateofbirth.text,
        'createdAt': ServerValue.timestamp,
      };
      await database.child('users').child(uid).set(userData);
    } catch (e) {
      Get.snackbar("Lỗi", "Không thể lưu thông tin: $e",
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.redAccent);
      throw e;
    }
  }

  // Hàm cập nhật thông tin người dùng
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
      Get.snackbar("Lỗi", "Không thể cập nhật thông tin: $e",
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.redAccent);
    } finally {
      isLoading.value = false;
    }
  }

  // Hàm tải thông tin người dùng từ Realtime Database
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
      Get.snackbar("Lỗi", "Không thể tải thông tin: $e",
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.redAccent);
    }
  }

  // Hàm thêm địa chỉ mới
  Future<void> addAddress() async {
    try {
      User? user = auth.currentUser;
      if (user != null) {
        isLoading.value = true;
        String addressId = database.child('users').child(user.uid).child('addresses').push().key ?? '';
        Map<String, dynamic> addressData = {
          'label': addressLabel.text,
          'details': addressDetails.text,
          'createdAt': ServerValue.timestamp,
        };
        await database.child('users').child(user.uid).child('addresses').child(addressId).set(addressData);
        Get.snackbar(
          "Thành công",
          "Địa chỉ đã được thêm!",
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.TOP,
        );
        addressLabel.clear();
        addressDetails.clear();
        loadAddresses();
      }
    } catch (e) {
      Get.snackbar("Lỗi", "Không thể thêm địa chỉ: $e",
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.redAccent);
    } finally {
      isLoading.value = false;
    }
  }

  // Hàm tải danh sách địa chỉ từ Realtime Database
  Future<void> loadAddresses() async {
    try {
      User? user = auth.currentUser;
      if (user != null) {
        DatabaseEvent event = await database.child('users').child(user.uid).child('addresses').once();
        if (event.snapshot.exists) {
          Map<dynamic, dynamic> addressData = event.snapshot.value as Map<dynamic, dynamic>;
          addresses.clear();
          addressData.forEach((key, value) {
            addresses.add({
              'id': key,
              'label': value['label'],
              'details': value['details'],
            });
          });
        }
      }
    } catch (e) {
      Get.snackbar("Lỗi", "Không thể tải địa chỉ: $e",
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.redAccent);
    }
  }

  @override
  void onClose() {
    // Giải phóng các controller khi không còn sử dụng
    fullname.dispose();
    password.dispose();
    email.dispose();
    mobilenumber.dispose();
    dateofbirth.dispose();
    addressLabel.dispose();
    addressDetails.dispose();
    super.onClose();
  }
}