import 'package:flutter/material.dart';
import '../../components/launch_page/button.dart';
import '../../components/launch_page/text_welcome_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

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
                'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit, sed do eiusmod.',
              ),
              const SizedBox(height: 30),
              Button(
                text: 'Log in',
                onPressed: () {},
                color: const Color(0xffF5CB58),
              ),
              const SizedBox(height: 5),
              Button(
                text: 'Sign Up',
                onPressed: () {},
                color: const Color(0xffF3E9B5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
