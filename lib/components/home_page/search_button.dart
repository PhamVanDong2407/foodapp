import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: const BoxDecoration(
        color: Colors.redAccent,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {},
        icon: const ImageIcon(
          AssetImage('assets/images/Vector.png'),
          color: Colors.white,
        ),
      ),
    );
  }
}
