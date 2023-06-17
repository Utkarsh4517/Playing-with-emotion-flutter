import 'package:emotion/colors.dart';
import 'package:emotion/widgets/body_text.dart';
import 'package:emotion/widgets/head_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            SizedBox(height: screenWidth * 0.1),
            Lottie.network(
              'https://assets5.lottiefiles.com/packages/lf20_s9dkwhdi.json',
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                left: screenWidth * 0.04,
              ),
              child: HeadText(
                text: 'Mental Peace >>>',
                color: blackColor,
                multiplicationFactor: 0.07,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(30),
              child: const BodyText(
                  bodyText:
                      'PWE aims to provide an objective and reliable stress management system using a sophisticated machine learning model to suggest songs and provide ideas to to overcome stress. Our goal is to levarage the power of music and practical strategies to help individuals cope with stress effectively.\n\nThe model utilizes various indicators, including respiration rate, body temperature, blood oxygen, eye movement, sleeping hours, and heart rate. By combining these features, our model can provide a comprehensive assessment of an individual stress level on a scale of 0, 1, 2, 3, 4.'),
            ),
          ],
        ),
      )),
    );
  }
}
