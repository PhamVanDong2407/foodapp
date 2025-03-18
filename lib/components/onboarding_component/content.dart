import 'package:flutter/material.dart';

class ContentBottomsheet extends StatelessWidget {
  const ContentBottomsheet({
    super.key,
    required this.imgBottomsheet,
    required this.textTitleBottomsheet,
    required this.textBottomsheet,
    required this.btnSheet,
    required this.textBtnSheet,
    required this.currentPage,
    required this.totalPages,
  });

  final String imgBottomsheet;
  final String textTitleBottomsheet;
  final String textBottomsheet;
  final VoidCallback btnSheet;
  final String textBtnSheet;
  final int currentPage; // 1-indexed (page 1, page 2, page 3)
  final int totalPages;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(imgBottomsheet),
        const SizedBox(height: 10),
        Text(
          textTitleBottomsheet,
          style: const TextStyle(
            color: Color(0xffE95322),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: Text(
            textBottomsheet,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            totalPages,
            (index) {
              // Note: index is 0-based but we want to match with currentPage which is 1-based
              final isCurrentPage = index + 1 == currentPage;
              return Container(
                margin: EdgeInsets.only(right: index < totalPages - 1 ? 8 : 0),
                width: isCurrentPage ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: isCurrentPage
                      ? const Color(0xffE95322)
                      : Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: btnSheet,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffE95322),
            minimumSize: const Size(140, 35),
          ),
          child: Text(
            textBtnSheet,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
