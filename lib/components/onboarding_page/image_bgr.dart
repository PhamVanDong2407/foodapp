import 'package:flutter/material.dart';

class ImageBgr extends StatelessWidget {
  const ImageBgr({super.key, required this.img});

  final String img; // Sửa kiểu dữ liệu từ Image thành String

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(img), // Giữ nguyên AssetImage
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
