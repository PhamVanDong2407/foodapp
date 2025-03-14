import 'package:flutter/material.dart';

/// Widget tái sử dụng cho nút đăng ký qua mạng xã hội
class SocialButton extends StatelessWidget {
  final String imagePath;

  const SocialButton({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffFFDECF),
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(10),
        ),
        child: Image.asset(imagePath, height: 30, width: 30),
      ),
    );
  }
}
