import 'package:flutter/material.dart';
import 'search_field.dart';
import 'action_button.dart';

class SearchAndActions extends StatelessWidget {
  const SearchAndActions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(child: SearchField()),
          SizedBox(width: 10),
          ActionButton(assetPath: 'assets/images/cart.png'),
          ActionButton(assetPath: 'assets/images/noti.png'),
          ActionButton(assetPath: 'assets/images/pro5.png'),
        ],
      ),
    );
  }
}
