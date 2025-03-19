import 'package:flutter/material.dart';

import '../../components/bottomNav.dart';
import '../../components/content_area.dart';
import '../../components/text_title_all.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5CB58),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextTitleAll(
                text_Title_Auth: 'My Profile',
                onPressed: () {},
                img_auth_page: 'assets/images/back_icon.png',
              ),
            ),
            const Expanded(
              child: ContentArea(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Bottomnav(),
    );
  }
}


