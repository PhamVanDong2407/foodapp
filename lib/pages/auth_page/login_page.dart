import 'package:flutter/material.dart';
import 'package:foodapp/components/auth_page/SocialButton.dart';
import 'package:get/get.dart';
import '../../controllers/auth/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());

    return Scaffold(
      backgroundColor: const Color(0xffF5CB58),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
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
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40),
                        Text(
                          'Welcome',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Color(0xFF303030),
                          ),
                        ),
                        SizedBox(height: 40),
                        TextFFLogin(),
                        SizedBox(height: 30),
                        orLoginDiff(),
                        SizedBox(height: 30),
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

class TextFFLogin extends StatelessWidget {
  const TextFFLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Email or Mobile Number',
          style: TextStyle(
            color: Color(0xFF505050),
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: loginController.email,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xffF3E9B5),
            hintText: 'Enter your email or phone number',
            hintStyle: TextStyle(
              color: Colors.grey[500],
              fontWeight: FontWeight.w400,
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            errorText: loginController.emailError.value.isEmpty
                ? null
                : loginController.emailError.value,
            errorStyle: const TextStyle(color: Colors.red),
          ),
        ),
        const SizedBox(height: 25),
        const Text(
          'Password',
          style: TextStyle(
            color: Color(0xFF505050),
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 12),
        Obx(() => TextFormField(
              controller: loginController.password,
              obscureText: loginController.isPasswordHidden.value,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xffF3E9B5),
                hintText: 'Enter your password',
                hintStyle: TextStyle(
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w400,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    loginController.isPasswordHidden.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: const Color(0xffE95322),
                  ),
                  onPressed: () {
                    loginController.togglePasswordVisibility();
                  },
                ),
                errorText: loginController.passwordError.value.isEmpty
                    ? null
                    : loginController.passwordError.value,
                errorStyle: const TextStyle(color: Colors.red),
              ),
            )),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              loginController.clearFields();
              Get.toNamed('/setpassword');
            },
            child: const Text(
              'Forgot Password?',
              style: TextStyle(
                color: Color(0xFFE95322),
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: Obx(() => ElevatedButton(
                onPressed: loginController.isLoading.value
                    ? null
                    : () {
                        loginController.onLogin();
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffE95322),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 2,
                ),
                child: loginController.isLoading.value
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        'Log In',
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

class orLoginDiff extends StatelessWidget {
  const orLoginDiff({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
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
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            loginController.clearFields();
            Get.toNamed('/signup');
          },
          child: RichText(
            text: const TextSpan(
              text: "Don't have an account? ",
              style: TextStyle(color: Colors.black, fontSize: 16),
              children: [
                TextSpan(
                  text: "Sign up",
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
