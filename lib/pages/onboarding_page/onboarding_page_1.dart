import 'package:flutter/material.dart';
import 'package:foodapp/components/onboarding/content.dart';
import 'package:foodapp/components/onboarding/image_bgr.dart';
import 'package:get/get.dart';

class OnboardingPage1 extends StatefulWidget {
  const OnboardingPage1({super.key});

  @override
  State<OnboardingPage1> createState() => _OnboardingPage1State();
}

class _OnboardingPage1State extends State<OnboardingPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background image
            const Positioned.fill(
              child: ImageBgr(img: 'assets/images/onboarding_1.png'),
            ),

            // Skip button
            Positioned(
              top: 20,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  // Navigate to next screen or skip onboarding
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

            // Bottom sheet - fixed at bottom
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 320,
                width: double.infinity,
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
                        'Lorem ipsum dolor sit amet, conse ctetur  \nadipiscing elit, sed do eiusmod tempor \nincididunt ut labore et dolore magna.',
                    btnSheet: () {
                      Get.toNamed('/onboarding2');
                    },
                    textBtnSheet: 'Next',
                    currentPage: 1,
                    // First page (now 1-indexed)
                    totalPages: 3, // Total of 3 pages
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
