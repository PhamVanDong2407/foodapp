import 'package:flutter/material.dart';
import 'package:foodapp/components/profile_component/menu_profile.dart';
import 'package:foodapp/components/home_component/actionbtn_bestseller.dart';
import 'package:foodapp/components/home_component/recommend.dart';
import '../../components/bottomNav.dart';
import '../../components/content_area.dart';
import '../../components/home_component/action_button.dart';
import '../../components/home_component/actionbtn_content.dart';
import '../../components/home_component/search_action.dart';
import '../../components/home_component/search_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5CB58),
      body: const SafeArea(
        child: Column(
          children: [
            SizedBox(height: 40),
            SearchAndActions(),
            SizedBox(height: 20),
            Expanded(
              child: ContentArea(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ActionbtnContent(),
                      SizedBox(height: 5),
                      Line(),
                      ActionbtnBestseller(),
                      Recommend(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Bottomnav(),
      endDrawer: Drawer(
        backgroundColor: Colors.transparent, // Drawer bọc ngoài trong suốt
        child: Container(
          padding: const EdgeInsets.only(top: 100), // Cách top 100
          color: const Color(0xffE95322), // Container bên trong giữ màu như cũ
          child: Column(
            children: [
              menuProfile(
                imgProfile: 'assets/images/pf1.png',
                nameProfile: 'My Orders',
                onTap: () {},
              ),
              menuProfile(
                imgProfile: 'assets/images/pf2.png',
                nameProfile: 'My Profile',
                onTap: () {},
              ),
              menuProfile(
                imgProfile: 'assets/images/pf3.png',
                nameProfile: 'Delivery Address',
                onTap: () {},
              ),
              menuProfile(
                imgProfile: 'assets/images/pf4.png',
                nameProfile: 'Payment Methods',
                onTap: () {},
              ),
              menuProfile(
                imgProfile: 'assets/images/pf5.png',
                nameProfile: 'Contact Us',
                onTap: () {},
              ),
              menuProfile(
                imgProfile: 'assets/images/pf6.png',
                nameProfile: 'Help & FAQs',
                onTap: () {},
              ),
              menuProfile(
                imgProfile: 'assets/images/pf7.png',
                nameProfile: 'Settings',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Line extends StatelessWidget {
  const Line({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: const Color(0xffE95322),
      margin: const EdgeInsets.symmetric(vertical: 10),
    );
  }
}
