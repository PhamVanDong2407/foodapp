import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  var isLoading = false.obs;
  var emailError = ''.obs;
  var passwordError = ''.obs;
  var successMessage = ''.obs;
  var isPasswordHidden = true.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void clearFields() {
    email.clear();
    password.clear();
    emailError.value = '';
    passwordError.value = '';
    successMessage.value = '';
  }

  void onLogin() async {
    emailError.value = '';
    passwordError.value = '';

    bool hasError = false;
    if (email.text.isEmpty) {
      emailError.value = 'Vui lòng nhập email hoặc số điện thoại';
      hasError = true;
    }
    if (password.text.isEmpty) {
      passwordError.value = 'Vui lòng nhập mật khẩu';
      hasError = true;
    }

    if (hasError) return;

    await loginAccount(email.text, password.text);
  }

  Future<void> loginAccount(String email, String password) async {
    try {
      isLoading.value = true;

      await auth.signInWithEmailAndPassword(email: email, password: password);

      successMessage.value = "Chào mừng bạn quay trở lại!";
      Get.snackbar(
        "Đăng nhập thành công!",
        successMessage.value,
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.TOP,
      );

      clearFields();

      // Uncomment và điều chỉnh nếu bạn muốn chuyển hướng sau khi đăng nhập
      Get.offAllNamed('/home');
    } on FirebaseAuthException catch (ex) {
      // Xử lý lỗi cụ thể với thông báo thân thiện hơn
      if (ex.code == "user-not-found") {
        emailError.value = "Tài khoản không tồn tại!";
        Get.snackbar(
          "Lỗi đăng nhập",
          "Tài khoản với email này không tồn tại!",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.TOP,
        );
      } else if (ex.code == "wrong-password") {
        passwordError.value = "Mật khẩu không đúng!";
        Get.snackbar(
          "Lỗi đăng nhập",
          "Mật khẩu bạn nhập không chính xác!",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.TOP,
        );
      } else if (ex.code == "invalid-email") {
        emailError.value = "Email không hợp lệ!";
        Get.snackbar(
          "Lỗi đăng nhập",
          "Định dạng email không đúng!",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.TOP,
        );
      } else {
        // Xử lý các lỗi khác với thông báo chung
        Get.snackbar(
          "Lỗi đăng nhập",
          "Đã xảy ra lỗi, vui lòng thử lại sau!",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (ex) {
      // Xử lý lỗi không xác định
      Get.snackbar(
        "Lỗi",
        "Đã xảy ra lỗi không mong muốn, vui lòng thử lại!",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }
}