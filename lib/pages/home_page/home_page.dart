import 'package:flutter/material.dart';
import 'package:foodapp/components/profile_component/logout_profile.dart';
import 'package:foodapp/components/profile_component/menu_profile.dart';
import 'package:foodapp/components/home_component/actionbtn_bestseller.dart';
import 'package:foodapp/components/home_component/recommend.dart';
import '../../components/bottomNav.dart';
import '../../components/content_area.dart';
import '../../components/home_component/actionbtn_content.dart';
import '../../components/home_component/search_action.dart';
import '../../components/profile_component/account_profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffF5CB58),
      body: SafeArea(
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
                      Line(
                        color: Color(0xffF5CB58),
                      ),
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
      bottomNavigationBar: Bottomnav(),
      endDrawer: ProfileDrawer(),
    );
  }
}

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Container(
        color: const Color(0xffE95322),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 100),
              const AccountProfile(), // Thêm thông tin người dùng ở đây
              const SizedBox(height: 20),
              _buildMenuItem(
                imgProfile: 'assets/images/pf1.png',
                nameProfile: 'My Orders',
                onTap: () {},
              ),
              _buildDivider(),
              _buildMenuItem(
                imgProfile: 'assets/images/pf2.png',
                nameProfile: 'My Profile',
                onTap: () {},
              ),
              _buildDivider(),
              _buildMenuItem(
                imgProfile: 'assets/images/pf3.png',
                nameProfile: 'Delivery Address',
                onTap: () {},
              ),
              _buildDivider(),
              _buildMenuItem(
                imgProfile: 'assets/images/pf4.png',
                nameProfile: 'Payment Methods',
                onTap: () {},
              ),
              _buildDivider(),
              _buildMenuItem(
                imgProfile: 'assets/images/pf5.png',
                nameProfile: 'Contact Us',
                onTap: () {},
              ),
              _buildDivider(),
              _buildMenuItem(
                imgProfile: 'assets/images/pf6.png',
                nameProfile: 'Help & FAQs',
                onTap: () {},
              ),
              _buildDivider(),
              _buildMenuItem(
                imgProfile: 'assets/images/pf7.png',
                nameProfile: 'Settings',
                onTap: () {},
              ),
              _buildDivider(),
              const SizedBox(height: 50),
              const LogoutProfile(),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method để tạo menu item
  Widget _buildMenuItem({
    required String imgProfile,
    required String nameProfile,
    required VoidCallback onTap,
  }) {
    return menuProfile(
      imgProfile: imgProfile,
      nameProfile: nameProfile,
      onTap: onTap,
    );
  }

  // Helper method để tạo divider
  Widget _buildDivider() {
    return const Column(
      children: [
        SizedBox(height: 5),
        Divider(
          height: 1,
          thickness: 1,
          color: Colors.white,
          indent: 0,
          endIndent: 0,
        ),
        SizedBox(height: 5),
      ],
    );
  }
}

class Line extends StatelessWidget {
  const Line({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: color,
      margin: const EdgeInsets.symmetric(vertical: 10),
    );
  }
}
