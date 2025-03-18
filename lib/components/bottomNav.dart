// bottomnav.dart
import 'package:flutter/material.dart';

class Bottomnav extends StatelessWidget {
  const Bottomnav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFFF5722), // Màu cam
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Image(
              image: AssetImage('assets/images/home1.png'),
              width: 28,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Image(
              image: AssetImage('assets/images/home2.png'),
              width: 28,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Image(
              image: AssetImage('assets/images/home3.png'),
              width: 28,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Image(
              image: AssetImage('assets/images/home4.png'),
              width: 28,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Image(
              image: AssetImage('assets/images/home5.png'),
              width: 28,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
