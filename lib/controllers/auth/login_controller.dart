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

      successMessage.value = "Đăng nhập thành công!";
      Get.snackbar("Thành công", successMessage.value,
          snackPosition: SnackPosition.BOTTOM);

      clearFields();

      // Uncomment và điều chỉnh nếu bạn muốn chuyển hướng sau khi đăng nhập
      // Get.offAllNamed('/home');
    } on FirebaseAuthException catch (ex) {
      if (ex.code == "user-not-found") {
        emailError.value = "Email không tồn tại!";
      } else if (ex.code == "wrong-password") {
        passwordError.value = "Mật khẩu không đúng!";
      } else {
        Get.snackbar("Lỗi", "Lỗi: ${ex.message}",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (ex) {
      Get.snackbar("Lỗi", "Đã xảy ra lỗi, vui lòng thử lại!",
          snackPosition: SnackPosition.BOTTOM);
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
