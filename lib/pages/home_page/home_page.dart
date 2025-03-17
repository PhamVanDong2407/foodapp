import 'package:flutter/material.dart';
import 'package:foodapp/components/home_page/actionbtn_bestseller.dart';
import '../../components/content_area.dart';
import '../../components/home_page/actionbtn_content.dart';
import '../../components/home_page/search_action.dart';

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
                      Line(),
                      ActionbtnBestseller(),
                    ],
                  ),
                ),
              ),
            ),
          ],
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
