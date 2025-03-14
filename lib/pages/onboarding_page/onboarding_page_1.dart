import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/onboarding_page/content.dart';
import '../../components/onboarding_page/image_bgr.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Hình nền
            const Positioned.fill(
              child: ImageBgr(img: 'assets/images/onboarding_1.png'),
            ),

            // Nút Skip
            Positioned(
              top: 20,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed('/welcome');
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Skip",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    const SizedBox(width: 8),
                    Image.asset(
                      'assets/images/icon_next.png',
                      width: 24,
                      height: 24,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Sheet
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 320,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ContentBottomsheet(
                    imgBottomsheet: 'assets/images/icon_onboarding_1.png',
                    textTitleBottomsheet: 'Order For Food',
                    textBottomsheet:
                        'Order your favorite food with just a few taps.',
                    btnSheet: () {
                      Get.toNamed('/onboarding2');
                    },
                    textBtnSheet: 'Next',
                    currentPage: 1,
                    totalPages: 3,
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
