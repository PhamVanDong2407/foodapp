import 'package:flutter/material.dart';
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
            // Background image
            const Positioned.fill(
              child: ImageBgr(img: 'assets/images/onboarding_3.png'),
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
                    imgBottomsheet: 'assets/images/icon_onboarding_3.png',
                    textTitleBottomsheet: 'Fast Delivery',
                    textBottomsheet:
                        'Lorem ipsum dolor sit amet, conse ctetur  \nadipiscing elit, sed do eiusmod tempor \nincididunt ut labore et dolore magna.',
                    btnSheet: () {
                      // Navigate to next page
                    },
                    textBtnSheet: 'Next',
                    currentPage: 3,
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
