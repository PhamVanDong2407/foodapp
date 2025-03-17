import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  // Khai báo các biến điều khiển nhập liệu
  TextEditingController fullname = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobilenumber = TextEditingController();
  TextEditingController dateofbirth = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  // Biến điều khiển trạng thái
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var successMessage = ''.obs;
  var isPasswordHidden = true.obs;

  // Hàm chuyển đổi trạng thái ẩn hiện mật khẩu
  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }


  // Hàm đăng ký người dùng
  void signUp() async {
    if (fullname.text.isEmpty ||
        password.text.isEmpty ||
        email.text.isEmpty ||
        mobilenumber.text.isEmpty ||
        dateofbirth.text.isEmpty) {
      errorMessage.value = 'Vui lòng điền đầy đủ thông tin';
      Get.snackbar("Lỗi", errorMessage.value,
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    // Reset lại thông báo
    errorMessage.value = '';
    successMessage.value = '';

    // Bắt đầu tạo tài khoản
    await registerUser(email.text, password.text);
  }

  // Hàm tạo tài khoản
  Future<void> registerUser(String email, String password) async {
    try {
      isLoading.value = true;

      await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      successMessage.value = 'Đăng ký thành công';
      Get.snackbar("Thành công", successMessage.value,
          snackPosition: SnackPosition.BOTTOM);

      errorMessage.value = ''; // Reset thông báo lỗi nếu tạo thành công
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        errorMessage.value = 'Mật khẩu quá yếu';
      } else if (ex.code == 'email-already-in-use') {
        errorMessage.value = 'Email đã được sử dụng';
      } else {
        errorMessage.value = "Lỗi: ${ex.message}";
      }
      Get.snackbar("Lỗi", errorMessage.value,
          snackPosition: SnackPosition.BOTTOM);
    } catch (ex) {
      errorMessage.value = "Đã xảy ra lỗi, vui lòng thử lại!";
      Get.snackbar("Lỗi", errorMessage.value,
          snackPosition: SnackPosition.BOTTOM);
      print(ex);
    } finally {
      isLoading.value = false;
    }
  }
}
