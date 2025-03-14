import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/onboarding_page/content.dart';
import '../../components/onboarding_page/image_bgr.dart';

class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Hình nền
            const Positioned.fill(
              child: ImageBgr(img: 'assets/images/onboarding_3.png'),
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
                    imgBottomsheet: 'assets/images/icon_onboarding_3.png',
                    textTitleBottomsheet: 'Fast Delivery',
                    textBottomsheet:
                        'Get your food delivered to your doorstep quickly.',
                    btnSheet: () {
                      Get.toNamed(
                          '/welcome');
                    },
                    textBtnSheet: 'Get Started',
                    currentPage: 3,
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
