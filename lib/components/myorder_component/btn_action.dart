import 'package:flutter/material.dart';

class BtnAction_Myorder extends StatelessWidget {
  const BtnAction_Myorder({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      // Add space-around distribution
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffE95322),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            // Consistent padding
            minimumSize:
                const Size(100, 40), // Set minimum size for consistency
          ),
          child: const Text(
            'Active',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffFFD8C7),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            // Consistent padding
            minimumSize:
                const Size(100, 40), // Set minimum size for consistency
          ),
          child: const Text(
            'Completed',
            style: TextStyle(
              color: Color(0xffE95322),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffFFD8C7),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            // Consistent padding
            minimumSize:
                const Size(100, 40), // Set minimum size for consistency
          ),
          child: const Text(
            'Cancelled',
            style: TextStyle(
              color: Color(0xffE95322),
            ),
          ),
        ),
      ],
    );
  }
}
