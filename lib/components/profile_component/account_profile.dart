import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountProfile extends StatelessWidget {
  const AccountProfile({super.key});

  @override
  Widget build(BuildContext context) {
    // Lấy thông tin user hiện tại từ FirebaseAuth
    User? user = FirebaseAuth.instance.currentUser;

    // Nếu user không null, reload để đảm bảo dữ liệu mới nhất
    if (user != null) {
      user.reload(); // Reload thông tin người dùng (nếu cần)
      user = FirebaseAuth.instance.currentUser; // Cập nhật lại user
    }

    // Kiểm tra nếu user không null thì lấy tên và email, nếu null thì hiển thị mặc định
    String displayName = user?.displayName ?? 'Người dùng';
    String email = user?.email ?? 'email@example.com';

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: user?.photoURL != null
                ? ClipOval(
              child: Image.network(
                user!.photoURL!,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            )
                : const Icon(
              Icons.person,
              size: 40,
              color: Color(0xffE95322),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  displayName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  email,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}