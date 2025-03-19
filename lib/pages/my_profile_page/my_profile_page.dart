import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/bottomNav.dart';
import '../../components/content_area.dart';
import '../../components/text_title_all.dart';
import '../../controllers/auth/signup_controller.dart'; // Đảm bảo import SignupController

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Khởi tạo SignupController
    Get.put(SignupController());
    return Scaffold(
      backgroundColor: const Color(0xffF5CB58),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextTitleAll(
                text_Title_Auth: 'My Profile',
                onPressed: () {},
                img_auth_page: 'assets/images/back_icon.png',
              ),
            ),
            const Expanded(
              child: ContentArea(
                child:
                    infoProfile(), // Thay thế btnUpdateProfile bằng infoProfile
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Bottomnav(),
    );
  }
}

class infoProfile extends StatelessWidget {
  const infoProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupController signupController = Get.find<SignupController>();

    // Tải thông tin người dùng khi vào trang
    signupController.loadUserProfile();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Thông tin cá nhân',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xffE95322),
            ),
          ),
          const SizedBox(height: 20),
          Obx(
            () => TextField(
              controller: signupController.fullname,
              decoration: InputDecoration(
                labelText: 'Họ và tên',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                errorText: signupController.fullnameError.value.isEmpty
                    ? null
                    : signupController.fullnameError.value,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Obx(
            () => TextField(
              controller: signupController.email,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                errorText: signupController.emailError.value.isEmpty
                    ? null
                    : signupController.emailError.value,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Obx(
            () => TextField(
              controller: signupController.mobilenumber,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Số điện thoại',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                errorText: signupController.mobileError.value.isEmpty
                    ? null
                    : signupController.mobileError.value,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Obx(
            () => TextField(
              controller: signupController.dateofbirth,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                labelText: 'Ngày sinh',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                errorText: signupController.dobError.value.isEmpty
                    ? null
                    : signupController.dobError.value,
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: Obx(
              () => ElevatedButton(
                onPressed: signupController.isLoading.value
                    ? null
                    : () {
                        _saveProfile(signupController);
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffE95322),
                  padding: const EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: signupController.isLoading.value
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        'Update', // Giữ nguyên text "Update" như btnUpdateProfile
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _saveProfile(SignupController controller) {
    controller.fullnameError.value = '';
    controller.emailError.value = '';
    controller.mobileError.value = '';
    controller.dobError.value = '';

    bool hasError = false;
    if (controller.fullname.text.isEmpty) {
      controller.fullnameError.value = 'Vui lòng nhập họ tên';
      hasError = true;
    }
    if (controller.email.text.isEmpty) {
      controller.emailError.value = 'Vui lòng nhập email';
      hasError = true;
    }
    if (controller.mobilenumber.text.isEmpty) {
      controller.mobileError.value = 'Vui lòng nhập số điện thoại';
      hasError = true;
    }
    if (controller.dateofbirth.text.isEmpty) {
      controller.dobError.value = 'Vui lòng nhập ngày sinh';
      hasError = true;
    }

    if (!hasError) {
      controller.updateUserProfile(); // Gọi hàm cập nhật lên Realtime Database
    }
  }
}

class btnUpdateProfile extends StatelessWidget {
  const btnUpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xffE95322),
        minimumSize: const Size(200, 30),
        padding: const EdgeInsets.all(15),
      ),
      child: const Text(
        'Update',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
