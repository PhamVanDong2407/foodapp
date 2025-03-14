import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text; // Văn bản hiển thị trên nút
  final VoidCallback onPressed; // Hành động khi nút được nhấn
  final Color color; // Màu sắc của nút (tùy chọn)
  final double fontSize; // Kích thước chữ (tùy chọn)

  const Button({
    Key? key,
    required this.text, // Chắc chắn rằng `text` phải được truyền vào
    required this.onPressed, // Hành động `onPressed` phải được truyền vào
    this.color = Colors.blue, // Màu sắc mặc định là màu xanh
    this.fontSize = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        // Tùy chỉnh màu sắc
        minimumSize: const Size(double.infinity, 30),
        // Chiều cao nút là 60 và chiều rộng tự động
        padding: const EdgeInsets.symmetric(
            vertical: 16.0), // Tùy chỉnh padding (có thể thay đổi theo nhu cầu)
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: const Color(0xffE95322),
        ), // Điều chỉnh kích thước chữ
      ),
    );
  }
}
