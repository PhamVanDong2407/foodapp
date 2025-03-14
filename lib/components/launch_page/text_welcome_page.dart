import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text; // Khai báo biến để lưu trữ text

  // Constructor để nhận tham số text
  const TextWidget(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
        textAlign: TextAlign.center,
      ),
    ); // Trả về widget Text với nội dung là text
  }
}
