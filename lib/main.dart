import 'package:flutter/material.dart';
import 'package:foodapp/pages/auth_page/login_page.dart';
import 'package:foodapp/pages/auth_page/setpassword_page.dart';
import 'package:foodapp/pages/auth_page/signup_page.dart';
import 'package:foodapp/pages/launch_page/splash_page.dart';
import 'package:foodapp/pages/launch_page/welcome_page.dart';
import 'package:foodapp/pages/onboarding_page/onboarding_page_1.dart';
import 'package:foodapp/pages/onboarding_page/onboarding_page_2.dart';
import 'package:foodapp/pages/onboarding_page/onboarding_page_3.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SetpasswordPage(),
    );
  }
}
