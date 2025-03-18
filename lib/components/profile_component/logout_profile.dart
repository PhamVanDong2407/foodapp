import 'package:flutter/material.dart';

class logoutProfile extends StatelessWidget {
  const logoutProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            shape: const CircleBorder(),
          ),
          icon: const Icon(
            Icons.logout,
            color: Color(0xffE95322),
          ),
        ),
        const Text(
          'Logout',
          style: TextStyle(
            color: Color(0xffF3E9B5),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
