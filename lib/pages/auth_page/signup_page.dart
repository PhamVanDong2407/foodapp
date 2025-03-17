import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/auth_page/SocialButton.dart';
import '../../components/auth_page/customTextField.dart';
import '../../components/auth_page/text_title.dart';
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
              padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
              child: TextTitle(
                text_Title_Auth: 'New Account',
                onPressed: () {
                  Get.toNamed('/login');
                },
                img_auth_page: 'assets/images/back_icon.png',
              ),
            ),
            const SizedBox(height: 20),
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
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFFSignup(),
                        SizedBox(height: 20),
                        orSignupDiff(),
                        SizedBox(height: 20),
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
        CustomTextField(
          controller: signupController.fullname,
          label: 'Full Name',
          hintText: 'Enter your full name',
        ),
        CustomTextField(
          controller: signupController.email,
          label: 'Email',
          hintText: 'Enter your email',
        ),
        Obx(() => CustomTextField(
              controller: signupController.password,
              label: 'Password',
              hintText: 'Enter your password',
              isPassword: true,
              obscureText: signupController.isPasswordHidden.value,
              toggleObscureText: () {
                signupController.togglePasswordVisibility();
              },
            )),
        CustomTextField(
          controller: signupController.mobilenumber,
          label: 'Mobile Number',
          hintText: 'Enter your mobile number',
          keyboardType: TextInputType.phone,
        ),
        CustomTextField(
          controller: signupController.dateofbirth,
          label: 'Date of Birth',
          hintText: 'Enter your date of birth',
          keyboardType: TextInputType.datetime,
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: Obx(() => ElevatedButton(
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
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              )),
        ),
      ],
    );
  }
}

/// Widget cho phần đăng ký qua mạng xã hội
class orSignupDiff extends StatelessWidget {
  const orSignupDiff({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Or sign up with'),
        const SizedBox(height: 10),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialButton(imagePath: 'assets/images/Gmail.png'),
            SocialButton(imagePath: 'assets/images/Facebook.png'),
            SocialButton(imagePath: 'assets/images/Mark.png'),
          ],
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            Get.toNamed('/login');
          },
          child: RichText(
            text: const TextSpan(
              text: "Already have an account? ",
              style: TextStyle(color: Colors.black, fontSize: 16),
              children: [
                TextSpan(
                  text: "Log in",
                  style: TextStyle(
                    color: Color(0xffE95322),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
