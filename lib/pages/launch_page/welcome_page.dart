import 'package:flutter/material.dart';
import '../../components/launch_page/button.dart';
import '../../components/launch_page/text_welcome_page.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE95322),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 70,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/welcome_page.png'),
              const SizedBox(height: 30),
              // Sử dụng TextWidget thay vì text
              const TextWidget(
                'Chào mừng bạn đến với ứng dụng của chúng tôi! \nHãy bắt đầu trải nghiệm ngay.',
              ),
              const SizedBox(height: 30),
              Button(
                text: 'Đăng nhập',
                onPressed: () {
                  Get.toNamed('/login');
                },
                color: const Color(0xffF5CB58),
              ),
              const SizedBox(height: 5),
              Button(
                text: 'Đăng ký',
                onPressed: () {
                  Get.toNamed('/signup');
                },
                color: const Color(0xffF3E9B5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
