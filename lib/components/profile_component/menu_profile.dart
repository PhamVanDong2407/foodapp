import 'package:flutter/material.dart';

class menuProfile extends StatelessWidget {
  const menuProfile({
    super.key,
    required this.imgProfile,
    required this.nameProfile,
    required this.onTap,
  });

  final String imgProfile;
  final String nameProfile;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onTap,
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            shape: const CircleBorder(),
          ),
          icon: ImageIcon(
            AssetImage(imgProfile),
          ),
        ),
        const SizedBox(width: 15),
        Text(
          nameProfile,
          style: const TextStyle(
            color: Color(0xffF3E9B5),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
