import 'package:flutter/material.dart';

class TextTitleAll extends StatelessWidget {
  const TextTitleAll(
      {super.key,
        required this.text_Title_Auth,
        required this.onPressed,
        required this.img_auth_page});

  final String text_Title_Auth;
  final VoidCallback onPressed;
  final String img_auth_page;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start, // Canh về bên trái
      children: [
        GestureDetector(
          onTap: () {
            onPressed();
          },
          child: Image.asset(
            img_auth_page,
            width: 24, // Điều chỉnh kích thước icon
            height: 24,
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              text_Title_Auth,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(width: 24), // Tạo một khoảng trống để giữ chữ ở giữa
      ],
    );
  }
}
