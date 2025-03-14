import 'package:flutter/material.dart';
import 'package:foodapp/pages/launch_page/splash_page.dart';
import 'package:foodapp/routes/route.dart';

import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: pages,
      home: const SplashPage(),
    );
  }
}
