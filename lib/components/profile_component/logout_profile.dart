import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogoutProfile extends StatelessWidget {
  const LogoutProfile({super.key});

  // Hàm xử lý đăng xuất
  Future<void> _handleLogout(BuildContext context) async {
    try {
      // Đăng xuất khỏi Firebase
      await FirebaseAuth.instance.signOut();

      // Điều hướng về màn hình đăng nhập (thay thế hoàn toàn stack hiện tại)
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/login', // Thay '/login' bằng route của màn hình đăng nhập trong ứng dụng của bạn
            (Route<dynamic> route) => false,
      );
    } catch (e) {
      // Hiển thị thông báo lỗi nếu đăng xuất thất bại
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Đăng xuất thất bại: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // Hàm hiển thị hộp thoại xác nhận
  Future<void> _showLogoutConfirmation(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text(
            'Xác nhận đăng xuất',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xffE95322),
            ),
          ),
          content: const Text(
            'Bạn có chắc chắn muốn đăng xuất không?',
            style: TextStyle(color: Colors.black87),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Đóng dialog mà không đăng xuất
              },
              child: const Text(
                'Hủy',
                style: TextStyle(color: Color(0xffE95322)),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Đóng dialog
                _handleLogout(context); // Thực hiện đăng xuất
              },
              child: const Text(
                'Đăng xuất',
                style: TextStyle(
                  color: Color(0xffE95322),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showLogoutConfirmation(context), // Hiển thị hộp thoại xác nhận
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(8),
            child: const Icon(
              Icons.logout,
              color: Color(0xffE95322),
              size: 24,
            ),
          ),
          const SizedBox(width: 15),
          const Text(
            'Log Out',
            style: TextStyle(
              color: Color(0xffF3E9B5),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}