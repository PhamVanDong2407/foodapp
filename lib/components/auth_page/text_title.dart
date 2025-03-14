import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  const TextTitle({super.key, required this.text_Title_Auth});

  final String text_Title_Auth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start, // Canh về bên trái
      children: [
        Image.asset(
          'assets/images/back_icon.png',
          width: 24, // Điều chỉnh kích thước icon
          height: 24,
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

class text extends StatelessWidget {
  const text({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
