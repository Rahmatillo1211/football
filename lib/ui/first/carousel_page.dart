import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final CarouselController _controller = CarouselController();
  int _currentIndex = 0;

  final List<Map<String, String>> carouselData = [
    {
      'image': 'assets/images/image1.png',
      'text': "Futbol o'yini",
      'points':
          'Professional liga futbol uchrashuvlarini tomosha qiling va o’ynang'
    },
    {
      'image': 'assets/images/image1.png',
      'text': 'Real vaqt statistikasi',
      'points':
          '105 mln ga 15 nafar uyinchini sotib oling va ularning xakikiy uyinlardagi xarakatlari uchun ochkolarni kulga kiriting. Xush, orzuingizdagi jamoaga kimlarni olasiz?'
    },
    {
      'image': 'assets/images/image1.png',
      'text': 'Liga turnir jadvali',
      'points': "Butun dunyo bo'ylab klublar statistikasi va ligadagi holati"
    },
    {
      'image': 'assets/images/image1.png',
      'text': 'This is the fourth item',
      'points': '40 points'
    },
    {
      'image': 'assets/images/image1.png',
      'text': 'This is the fifth item',
      'points': '50 points'
    },
    {
      'image': 'assets/images/image1.png',
      'text': 'This is the sixth item',
      'points': '60 points'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider.builder(
            itemCount: carouselData.length,
            carouselController: _controller,
            options: CarouselOptions(
              autoPlay: true,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              aspectRatio: 1.0,
              onPageChanged: (index, reason) {
                setState(
                  () {
                    _currentIndex = index;
                  },
                );
              },
            ),
            itemBuilder: (context, index, realIndex) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    carouselData[index]['image']!,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 50),
                  Text(
                    carouselData[index]['text']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    carouselData[index]['points']!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 76),
          AnimatedSmoothIndicator(
            activeIndex: _currentIndex,
            count: carouselData.length,
            effect: const ExpandingDotsEffect(
              dotWidth: 12.0,
              dotHeight: 12.0,
              activeDotColor: Color.fromRGBO(107, 255, 2, 0.898),
              dotColor: Color.fromRGBO(81, 238, 92, 0.4),
            ),
          ),
        ],
      ),
    );
  }
}
