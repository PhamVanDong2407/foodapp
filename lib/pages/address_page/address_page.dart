import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/bottomNav.dart';
import '../../components/content_area.dart';
import '../../components/text_title_all.dart';
import '../../controllers/auth/signup_controller.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Khởi tạo SignupController trước khi sử dụng Get.find()
    Get.put(SignupController());
    return Scaffold(
      backgroundColor: const Color(0xffF5CB58), // Màu nền vàng
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextTitleAll(
                text_Title_Auth: 'Delivery Address',
                onPressed: () {
                  Get.back(); // Quay lại trang trước
                },
                img_auth_page: 'assets/images/back_icon.png',
              ),
            ),
            const Expanded(
              child: ContentArea(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      infoAddress(), // Widget hiển thị danh sách địa chỉ
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Bottomnav(), // Thanh điều hướng dưới cùng
    );
  }
}

// Widget hiển thị danh sách địa chỉ
class infoAddress extends StatelessWidget {
  const infoAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupController signupController = Get.find();

    return Column(
      children: [
        // Danh sách địa chỉ
        Obx(
          () => signupController.addresses.isEmpty
              ? const Center(child: Text('Chưa có địa chỉ nào.'))
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: signupController.addresses.length,
                  itemBuilder: (context, index) {
                    var address = signupController.addresses[index];
                    return Column(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.home_outlined,
                              color: Color(0xffE95322), // Màu cam
                              size: 30,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    address['label'],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    address['details'],
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.radio_button_unchecked,
                              color: Color(0xffE95322), // Màu cam
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Divider(color: Colors.grey), // Đường phân cách
                      ],
                    );
                  },
                ),
        ),
        const SizedBox(height: 20),
        // Nút thêm địa chỉ mới
        ElevatedButton(
          onPressed: () {
            // Hiển thị dialog để thêm địa chỉ mới
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Thêm địa chỉ mới'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: signupController.addressLabel,
                      decoration: const InputDecoration(
                        labelText: 'Tên địa chỉ (VD: Nhà riêng)',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: signupController.addressDetails,
                      decoration: const InputDecoration(
                        labelText: 'Chi tiết địa chỉ',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      signupController.addressLabel.clear();
                      signupController.addressDetails.clear();
                      Get.back();
                    },
                    child: const Text('Hủy'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      signupController.addAddress();
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffE95322), // Màu cam
                    ),
                    child: const Text(
                      'Thêm',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            side: const BorderSide(color: Color(0xffE95322)), // Viền màu cam
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Text(
            'Thêm địa chỉ mới',
            style: TextStyle(
              color: Color(0xffE95322), // Màu chữ cam
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}

// Widget đường phân cách
class Line extends StatelessWidget {
  const Line({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: color,
      margin: const EdgeInsets.symmetric(vertical: 10),
    );
  }
}

// Widget nút cập nhật (hiện tại chưa sử dụng, nhưng giữ lại theo code gốc)
class btnAddAddress extends StatelessWidget {
  const btnAddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xffE95322), // Màu cam
        minimumSize: const Size(200, 30),
        padding: const EdgeInsets.all(15),
      ),
      child: const Text(
        'Cập nhật',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
