import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String assetPath;

  const ActionButton({super.key, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      style: IconButton.styleFrom(
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
      ),
      icon: ImageIcon(
        AssetImage(assetPath),
        color: const Color(0xffE95322),
      ),
    );
  }
}
