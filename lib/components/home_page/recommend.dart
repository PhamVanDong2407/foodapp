import 'package:flutter/material.dart';
import '../../models/home_page_model/recommend_item.dart';

class Recommend extends StatelessWidget {
  const Recommend({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textRecom(),
              SizedBox(height: 5),
              allRecom(),
            ],
          ),
        ),
      ],
    );
  }
}

class textRecom extends StatelessWidget {
  const textRecom({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Recommend',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class allRecom extends StatelessWidget {
  const allRecom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            itemRecom(
              item: RecommendationItem(
                imagePath: 'assets/images/recom1.png',
                price: '36.000đ',
                rating: '5.0',
              ),
            ),
            itemRecom(
              item: RecommendationItem(
                imagePath: 'assets/images/recom2.png',
                price: '76.000đ',
                rating: '5.0',
              ),
            ),
          ],
        ),
        const SizedBox(height: 10), // Khoảng cách giữa hai hàng
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            itemRecom(
              item: RecommendationItem(
                imagePath: 'assets/images/recom1.png',
                price: '50.000đ',
                rating: '4.5',
              ),
            ),
            itemRecom(
              item: RecommendationItem(
                imagePath: 'assets/images/recom2.png',
                price: '143.000đ',
                rating: '5.0',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class itemRecom extends StatelessWidget {
  final RecommendationItem item;

  const itemRecom({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.42,
      height: MediaQuery.of(context).size.width * 0.42 * 1.2,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              item.imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Positioned(
            top: 6,
            left: 6,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Text(
                    item.rating,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Icon(
                    Icons.star_rate_rounded,
                    color: Colors.yellow,
                    size: 14,
                  ),
                  const SizedBox(width: 3),
                  const Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                    size: 14,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 6,
            right: 6,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xffE95322),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                item.price,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
