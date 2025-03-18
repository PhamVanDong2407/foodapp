import 'package:flutter/material.dart';
import 'search_field.dart';
import 'action_button.dart';

class SearchAndActions extends StatelessWidget {
  const SearchAndActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          const Expanded(child: SearchField()),
          const SizedBox(width: 10),
          ActionButton(
            assetPath: 'assets/images/cart.png',
            onPressed: () {},
          ),
          ActionButton(
            assetPath: 'assets/images/noti.png',
            onPressed: () {},
          ),
          Builder(
            builder: (context) => ActionButton(
              assetPath: 'assets/images/pro5.png',
              onPressed: () {
                Scaffold.of(context).openEndDrawer(); // Mở endDrawer
              },
            ),
          ),
        ],
      ),
    );
  }
}
