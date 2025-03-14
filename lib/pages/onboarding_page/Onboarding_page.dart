import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/onboarding_page/content.dart';
import '../../components/onboarding_page/image_bgr.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/onboarding_1.png",
      "icon": "assets/images/icon_onboarding_1.png",
      "title": "Order For Food",
      "description": "Order your favorite food with just a few taps on your phone.",
    },
    {
      "image": "assets/images/onboarding_2.png",
      "icon": "assets/images/icon_onboarding_2.png",
      "title": "Easy Payment",
      "description": "Pay effortlessly with multiple payment methods.",
    },
    {
      "image": "assets/images/onboarding_3.png",
      "icon": "assets/images/icon_onboarding_3.png",
      "title": "Fast Delivery",
      "description": "Get your food delivered to your doorstep quickly.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // PageView cho hình nền và nội dung
            PageView.builder(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemCount: onboardingData.length,
              itemBuilder: (context, index) {
                final data = onboardingData[index];
                return Stack(
                  children: [
                    // Hình nền
                    Positioned.fill(
                      child: ImageBgr(img: data["image"]!),
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
                            imgBottomsheet: data["icon"]!,
                            textTitleBottomsheet: data["title"]!,
                            textBottomsheet: data["description"]!,
                            btnSheet: () {
                              if (_currentPage < onboardingData.length - 1) {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              } else {
                                Get.offNamed('/login');
                              }
                            },
                            textBtnSheet: _currentPage == onboardingData.length - 1
                                ? "Get Started"
                                : "Next",
                            currentPage: _currentPage + 1,
                            totalPages: onboardingData.length,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            // Nút Skip
            Positioned(
              top: 20,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  Get.offNamed('/login');
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
          ],
        ),
      ),
    );
  }
}