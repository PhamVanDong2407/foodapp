import 'package:flutter/material.dart';
import 'package:foodapp/components/myorder_component/btn_action.dart';
import 'package:foodapp/components/myorder_component/noti_noorder.dart';
import 'package:foodapp/components/text_title_all.dart';

import '../../components/bottomNav.dart';
import '../../components/content_area.dart';

class MyorderPage extends StatelessWidget {
  const MyorderPage({super.key});

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
                text_Title_Auth: 'My Orders',
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
                      BtnAction_Myorder(),
                      SizedBox(height: 180),
                      Center(
                        child: Noti_No_Order(),
                      ),
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
