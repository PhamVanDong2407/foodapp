import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/auth_component/SocialButton.dart';
import '../../components/auth_component/customTextField.dart';
import '../../components/auth_component/text_title.dart';
import '../../controllers/auth/signup_controller.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupController signupController = Get.put(SignupController());

    return Scaffold(
      backgroundColor: const Color(0xffF5CB58),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextTitle(
                text_Title_Auth: 'Tạo tài khoản',
                onPressed: () {
                  signupController.clearFields();
                  Get.toNamed('/login');
                },
                img_auth_page: 'assets/images/back_icon.png',
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x20000000),
                      blurRadius: 10,
                      offset: Offset(0, -3),
                    )
                  ],
                ),
                child: const SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFFSignup(),
                        SizedBox(height: 15),
                        OrSignupDiff(),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFFSignup extends StatelessWidget {
  const TextFFSignup({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupController signupController = Get.find();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => CustomTextField(
            controller: signupController.fullname,
            label: 'Họ và tên',
            hintText: 'Nhập họ và tên',
            errorText: signupController.fullnameError.value.isEmpty
                ? null
                : signupController.fullnameError.value,
          ),
        ),
        const SizedBox(height: 10),
        Obx(
          () => CustomTextField(
            controller: signupController.email,
            label: 'Email',
            hintText: 'Nhập email',
            errorText: signupController.emailError.value.isEmpty
                ? null
                : signupController.emailError.value,
          ),
        ),
        const SizedBox(height: 10),
        Obx(
          () => CustomTextField(
            controller: signupController.password,
            label: 'Mật khẩu',
            hintText: 'Nhập mật khẩu',
            isPassword: true,
            obscureText: signupController.isPasswordHidden.value,
            toggleObscureText: () {
              signupController.togglePasswordVisibility();
            },
            errorText: signupController.passwordError.value.isEmpty
                ? null
                : signupController.passwordError.value,
          ),
        ),
        const SizedBox(height: 10),
        Obx(
          () => CustomTextField(
            controller: signupController.mobilenumber,
            label: 'Số điện thoại',
            hintText: 'Nhập số điện thoại',
            keyboardType: TextInputType.phone,
            errorText: signupController.mobileError.value.isEmpty
                ? null
                : signupController.mobileError.value,
          ),
        ),
        const SizedBox(height: 10),
        Obx(
          () => CustomTextField(
            controller: signupController.dateofbirth,
            label: 'Ngày sinh',
            hintText: 'Nhập ngày sinh',
            keyboardType: TextInputType.datetime,
            errorText: signupController.dobError.value.isEmpty
                ? null
                : signupController.dobError.value,
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          width: double.infinity,
          height: 45,
          child: Obx(
            () => ElevatedButton(
              onPressed: signupController.isLoading.value
                  ? null
                  : () {
                      signupController.signUp();
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffE95322),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 2,
              ),
              child: signupController.isLoading.value
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text(
                      'Đăng ký',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}

class OrSignupDiff extends StatelessWidget {
  const OrSignupDiff({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupController signupController = Get.find();

    return Column(
      children: [
        const Text('Hoặc đăng ký bằng', style: TextStyle(fontSize: 14)),
        const SizedBox(height: 8),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialButton(
              imagePath: 'assets/images/Gmail.png',
            ),
            SizedBox(width: 10),
            SocialButton(
              imagePath: 'assets/images/Facebook.png',
            ),
            SizedBox(width: 10),
            SocialButton(
              imagePath: 'assets/images/Mark.png',
            ),
          ],
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            signupController.clearFields();
            Get.toNamed('/login');
          },
          child: RichText(
            text: const TextSpan(
              text: "Bạn đã có tài khoản? ",
              style: TextStyle(color: Colors.black, fontSize: 14),
              children: [
                TextSpan(
                  text: "Đăng nhập",
                  style: TextStyle(
                    color: Color(0xffE95322),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
