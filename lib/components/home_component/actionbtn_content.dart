import 'package:flutter/material.dart';

class ActionbtnContent extends StatelessWidget {
  const ActionbtnContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            IconButton(
              onPressed: () {

              },
              style: IconButton.styleFrom(
                padding: const EdgeInsets.all(15),
                backgroundColor: const Color(0xffF3E9B5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              icon: const ImageIcon(
                AssetImage('assets/images/Snacks.png'),
                color: Color(0xffE95322),
                size: 30,
              ),
            ),
            const Text(
              'Snacks',
              style: TextStyle(
                color: Color(0xffE95322),
              ),
            ),
          ],
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {

              },
              style: IconButton.styleFrom(
                padding: const EdgeInsets.all(15),
                backgroundColor: const Color(0xffF3E9B5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              icon: const ImageIcon(
                AssetImage('assets/images/Meals.png'),
                color: Color(0xffE95322),
                size: 30,
              ),
            ),
            const Text(
              'Meal',
              style: TextStyle(
                color: Color(0xffE95322),
              ),
            ),
          ],
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {

              },
              style: IconButton.styleFrom(
                padding: const EdgeInsets.all(15),
                backgroundColor: const Color(0xffF3E9B5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              icon: const ImageIcon(
                AssetImage('assets/images/Vegan.png'),
                color: Color(0xffE95322),
                size: 30,
              ),
            ),
            const Text(
              'Vegan',
              style: TextStyle(
                color: Color(0xffE95322),
              ),
            ),
          ],
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {

              },
              style: IconButton.styleFrom(
                padding: const EdgeInsets.all(15),
                backgroundColor: const Color(0xffF3E9B5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              icon: const ImageIcon(
                AssetImage('assets/images/Desserts.png'),
                color: Color(0xffE95322),
                size: 30,
              ),
            ),
            const Text(
              'Dessert',
              style: TextStyle(
                color: Color(0xffE95322),
              ),
            ),
          ],
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {

              },
              style: IconButton.styleFrom(
                padding: const EdgeInsets.all(15),
                backgroundColor: const Color(0xffF3E9B5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              icon: const ImageIcon(
                AssetImage('assets/images/Drinks.png'),
                color: Color(0xffE95322),
                size: 30,
              ),
            ),
            const Text(
              'Drinks',
              style: TextStyle(
                color: Color(0xffE95322),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
