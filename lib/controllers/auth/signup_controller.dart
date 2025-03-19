import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  TextEditingController fullname = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobilenumber = TextEditingController();
  TextEditingController dateofbirth = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

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
    // Reset lỗi trước khi kiểm tra
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
    }
    if (password.text.isEmpty) {
      passwordError.value = 'Vui lòng nhập mật khẩu';
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

    await registerUser(email.text, password.text);
  }

  Future<void> registerUser(String email, String password) async {
    try {
      isLoading.value = true;

      await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      successMessage.value = 'Đăng ký thành công';
      Get.snackbar(
        "Thành công",
        successMessage.value,
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.TOP,
      );

      clearFields();

      // Có thể thêm điều hướng sau khi đăng ký thành công
      Get.offAllNamed('/login');
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        passwordError.value = 'Mật khẩu quá yếu (tối thiểu 6 ký tự)';
      } else if (ex.code == 'email-already-in-use') {
        emailError.value = 'Email đã được sử dụng';
      } else {
        Get.snackbar("Lỗi", "Lỗi: ${ex.message}",
            snackPosition: SnackPosition.TOP);
      }
    } catch (ex) {
      Get.snackbar("Lỗi", "Đã xảy ra lỗi, vui lòng thử lại!",
          snackPosition: SnackPosition.TOP);
    } finally {
      isLoading.value = false;
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
