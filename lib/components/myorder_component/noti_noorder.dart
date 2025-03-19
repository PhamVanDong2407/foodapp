import 'package:flutter/material.dart';

class Noti_No_Order extends StatelessWidget {
  const Noti_No_Order({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/myorder.png'),
        const SizedBox(height: 20),
        const Center(
          child: Text(
            "You don't have any \nactive orders at this \ntime",
            style: TextStyle(
              color: Color(0xffE95322),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
