import 'dart:async';
import 'package:flutter/material.dart';
import 'package:foodapp/pages/onboarding_page/onboarding_page_1.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Chuyển sang OnboardingPage1 sau 2 giây
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingPage1()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5CB58),
      body: SafeArea(
        child: Center(
          child: Image.asset('assets/images/splash_page.png'),
        ),
      ),
    );
  }
}
