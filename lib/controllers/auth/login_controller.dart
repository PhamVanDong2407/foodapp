import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // Các TextEditingController để người dùng nhập thông tin
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  // Trạng thái để quản lý việc xử lý đăng nhập
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var successMessage = ''.obs;
  var isPasswordHidden = true.obs;

  // Hàm chuyển đổi trạng thái hiển thị mật khẩu
  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  // Hàm đăng nhập người dùng
  void onLogin() async {
    if (email.text.isEmpty || password.text.isEmpty) {
      errorMessage.value = 'Vui lòng điền đầy đủ thông tin!';
      Get.snackbar("Lỗi", errorMessage.value,
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    // Reset thông báo
    errorMessage.value = '';
    successMessage.value = '';

    await loginAccount(email.text, password.text);
  }

  // Hàm đăng nhập
  Future<void> loginAccount(String email, String password) async {
    try {
      isLoading.value = true; // Bật trạng thái loading

      // Đăng nhập người dùng
      await auth.signInWithEmailAndPassword(email: email, password: password);

      // Hiển thị thông báo đăng nhập thành công
      successMessage.value = "Đăng nhập thành công!";
      Get.snackbar("Thành công", successMessage.value,
          snackPosition: SnackPosition.BOTTOM);

      errorMessage.value = ''; // Reset thông báo lỗi nếu đăng nhập thành công
    } on FirebaseAuthException catch (ex) {
      if (ex.code == "user-not-found") {
        errorMessage.value = "Email không tồn tại, vui lòng kiểm tra lại!";
      } else if (ex.code == "wrong-password") {
        errorMessage.value = "Mật khẩu sai, vui lòng thử lại!";
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
      isLoading.value = false; // Tắt trạng thái loading
    }
  }
}
