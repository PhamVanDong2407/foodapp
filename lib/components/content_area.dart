import 'package:flutter/material.dart';

class ContentArea extends StatelessWidget {
  final Widget? child; // Cho phép nhận widget con

  const ContentArea({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height * 1, // Chiều cao tối thiểu là 80% màn hình
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x20000000),
              blurRadius: 10,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: child ?? const SizedBox(), // Nếu không có child, render một widget rỗng
      ),
    );
  }
}