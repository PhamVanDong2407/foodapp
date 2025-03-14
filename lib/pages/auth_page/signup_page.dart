import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../components/auth_page/SocialButton.dart';
import '../../components/auth_page/customTextField.dart';
import '../../components/auth_page/text_title.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
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

class TextFFSignup extends StatefulWidget {
  const TextFFSignup({super.key});

  @override
  State<TextFFSignup> createState() => _TextFFSignupState();
}

class _TextFFSignupState extends State<TextFFSignup> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  bool _obscureText = true;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _mobileController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          controller: _fullNameController,
          label: 'Full Name',
          hintText: 'Enter your full name',
        ),
        CustomTextField(
          controller: _emailController,
          label: 'Email',
          hintText: 'Enter your email',
        ),
        CustomTextField(
          controller: _passwordController,
          label: 'Password',
          hintText: 'Enter your password',
          isPassword: true,
          obscureText: _obscureText,
          toggleObscureText: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        CustomTextField(
          controller: _mobileController,
          label: 'Mobile Number',
          hintText: 'Enter your mobile number',
          keyboardType: TextInputType.phone,
        ),
        CustomTextField(
          controller: _dobController,
          label: 'Date of Birth',
          hintText: 'Enter your date of birth',
          keyboardType: TextInputType.datetime,
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              Get.toNamed('/login');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffE95322),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 2,
            ),
            child: const Text(
              'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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
