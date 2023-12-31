import 'package:emotion/PageView/intro_page1.dart';
import 'package:emotion/PageView/intro_page2.dart';
import 'package:emotion/PageView/intro_page3.dart';
import 'package:emotion/homepage.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  void _completeOnboarding() async {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const MyHomePage())); // PageViewHome()
  }

  final PageController _controller = PageController();

  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            controller: _controller,
            children: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.7),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        activeDotColor: Colors.black,
                        dotWidth: screenWidth * 0.053,
                        dotHeight: screenWidth * 0.033,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40)
                      .copyWith(left: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: GestureDetector(
                          onTap: () {
                            _controller.jumpToPage(2);
                          },
                          child: Text(
                            'Skip',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: screenWidth * 0.05),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: onLastPage
                            ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(screenWidth * 0.03)
                                      .copyWith(
                                          left: screenWidth * 0.1,
                                          right: screenWidth * 0.1),
                                ),
                                onPressed: () {
                                  _completeOnboarding();
                                },
                                child: const Text(
                                  'Done',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 20),
                                ),
                              )
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(screenWidth * 0.03)
                                      .copyWith(
                                          left: screenWidth * 0.1,
                                          right: screenWidth * 0.1),
                                ),
                                onPressed: () {
                                  _controller.nextPage(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeIn);
                                },
                                child: const Text(
                                  'Next',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 20),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
