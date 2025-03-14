import 'package:foodapp/pages/auth_page/login_page.dart';
import 'package:foodapp/pages/auth_page/setpassword_page.dart';
import 'package:foodapp/pages/auth_page/signup_page.dart';
import 'package:foodapp/pages/launch_page/splash_page.dart';
import 'package:foodapp/pages/launch_page/welcome_page.dart';
import 'package:foodapp/pages/onboarding_page/onboarding_page_1.dart';
import 'package:foodapp/pages/onboarding_page/onboarding_page_2.dart';
import 'package:foodapp/pages/onboarding_page/onboarding_page_3.dart';
import 'package:get/get.dart';

var pages = [
  GetPage(
    name: '/splash',
    page: () => const SplashPage(),
  ),
  GetPage(
    name: '/welcome',
    page: () => const WelcomePage(),
  ),
  GetPage(
    name: '/onboarding1',
    page: () => const OnboardingPage1(),
  ),
  GetPage(
    name: '/onboarding2',
    page: () => const OnboardingPage2(),
  ),
  GetPage(
    name: '/onboarding3',
    page: () => const OnboardingPage3(),
  ),
  GetPage(
    name: '/login',
    page: () => const LoginPage(),
  ),
  GetPage(
    name: '/signup',
    page: () => const SignupPage(),
  ),
  GetPage(
    name: '/setpassword',
    page: () => const SetpasswordPage(),
  ),
];
