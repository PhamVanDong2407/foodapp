import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/auth_component/customTextField.dart';
import '../../components/auth_component/text_title.dart';

class SetpasswordPage extends StatefulWidget {
  const SetpasswordPage({super.key});

  @override
  State<SetpasswordPage> createState() => _SetpasswordPageState();
}

class _SetpasswordPageState extends State<SetpasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5CB58),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
              child: TextTitle(
                text_Title_Auth: 'Đặt lại mật khẩu',
                onPressed: () {
                  Get.toNamed('/login');
                },
                img_auth_page: 'assets/images/back_icon.png',
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x20000000),
                      blurRadius: 10,
                      offset: Offset(0, -3),
                    ),
                  ],
                ),
                child: const SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40),
                        TextFFSignup(),
                      ],
                    ),
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

class TextFFSignup extends StatefulWidget {
  const TextFFSignup({super.key});

  @override
  State<TextFFSignup> createState() => _TextFFSignupState();
}

class _TextFFSignupState extends State<TextFFSignup> {
  final TextEditingController _emailController = TextEditingController();
  String? _emailError; // Biến lưu thông điệp lỗi
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> passwordReset() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );

      Get.snackbar(
        'Thành công',
        'Vui lòng kiểm tra email để đặt lại mật khẩu.',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.toNamed('/login');
    } on FirebaseAuthException catch (e) {
      print('Lỗi Firebase: ${e.code} - ${e.message}');
      String errorMessage;

      switch (e.code) {
        case 'invalid-email':
          errorMessage = 'Email không hợp lệ.';
          break;
        case 'user-not-found':
          errorMessage = 'Không tìm thấy tài khoản với email này.';
          break;
        case 'network-request-failed':
          errorMessage = 'Lỗi kết nối mạng. Hãy thử lại sau.';
          break;
        case 'too-many-requests':
          errorMessage = 'Bạn đã gửi quá nhiều yêu cầu. Hãy thử lại sau.';
          break;
        default:
          errorMessage = 'Có lỗi xảy ra, vui lòng thử lại.';
      }

      Get.snackbar(
        'Lỗi',
        errorMessage,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _handleSetPassword() {
    final email = _emailController.text.trim();

    if (email.isEmpty) {
      setState(() {
        _emailError = 'Email không được để trống';
      });
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      setState(() {
        _emailError = 'Vui lòng nhập email hợp lệ';
      });
    } else {
      setState(() {
        _emailError = null; // Xóa lỗi nếu hợp lệ
      });
      // Gọi hàm passwordReset() để thực hiện reset password
      passwordReset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          controller: _emailController,
          label: 'Email',
          hintText: 'Nhập email của bạn',
          keyboardType: TextInputType.emailAddress,
        ),
        if (_emailError != null) // Hiển thị lỗi nếu có
          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: Text(
              _emailError!,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: _isLoading ? null : _handleSetPassword,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffE95322),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 2,
              disabledBackgroundColor: Colors.grey,
            ),
            child: _isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : const Text(
                    'Đặt lại mât khẩu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
