import 'package:flutter/material.dart';
import '../../components/auth_page/customTextField.dart';
import '../../components/auth_page/text_title.dart';
import 'package:get/get.dart';

class SetpasswordPage extends StatelessWidget {
  const SetpasswordPage({super.key});

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
                text_Title_Auth: 'Set Password',
                onPressed: () {
                  Get.toNamed('/login');
                },
                img_auth_page: 'assets/images/back_icon.png',
              ),
            ),
            const SizedBox(height: 40),
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
                        SizedBox(height: 40),
                        TextFFSignup(),
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
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          controller: _confirmpasswordController,
          label: 'Confirm Password',
          hintText: 'Enter your password',
          isPassword: true,
          obscureText: _obscureText,
          toggleObscureText: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
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
              'Create New Password',
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
