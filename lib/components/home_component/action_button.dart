import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String assetPath;
  final VoidCallback onPressed;

  const ActionButton({
    super.key,
    required this.assetPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed, // Use the provided onPressed callback
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