import 'package:flutter/material.dart';

class ActionbtnBestseller extends StatelessWidget {
  const ActionbtnBestseller({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextTitle(),
              SizedBox(height: 5),
              ImgBestSeller(),
              SizedBox(height: 5),
            ],
          ),
        ),
        SizedBox(height: 15),
        SizedBox(
          height: 200, // Đặt chiều cao cố định cho banner
          child: SlideBanner(),
        ),
      ],
    );
  }
}

class TextTitle extends StatelessWidget {
  const TextTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Best Seller',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              const Text(
                'View All',
                style: TextStyle(
                  color: Color(0xffE95322),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              Image.asset('assets/images/icon_next.png'),
            ],
          ),
        ),
      ],
    );
  }
}

class ImgBestSeller extends StatelessWidget {
  const ImgBestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildBestSellerItem('assets/images/best1.png', '45.000đ'),
        _buildBestSellerItem('assets/images/best2.png', '50.000đ'),
        _buildBestSellerItem('assets/images/best3.png', '55.000đ'),
        _buildBestSellerItem('assets/images/best4.png', '60.000đ'),
      ],
    );
  }

  Widget _buildBestSellerItem(String imagePath, String price) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {},
          icon: Image.asset(imagePath),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: const Color(0xffE95322),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              price,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SlideBanner extends StatefulWidget {
  const SlideBanner({super.key});

  @override
  State<SlideBanner> createState() => _SlideBannerState();
}

class _SlideBannerState extends State<SlideBanner> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    // Tự động chuyển trang sau mỗi 3 giây
    Future.delayed(const Duration(seconds: 1), () {
      _autoScrollBanner();
    });
  }

  void _autoScrollBanner() {
    Future.delayed(const Duration(seconds: 3), () {
      if (_pageController.hasClients) {
        if (_currentPage < 4) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        _autoScrollBanner();
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: 5,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: const Color(0xffE95322),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Giảm giá ${index + 1}0%',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Cho đơn hàng đầu tiên',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: const Color(0xffE95322),
                                    ),
                                    child: const Text('Đặt ngay'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                          'assets/images/Photo Pizza.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index
                    ? const Color(0xffE95322)
                    : Colors.grey.shade300,
              ),
            );
          }),
        ),
      ],
    );
  }
}
