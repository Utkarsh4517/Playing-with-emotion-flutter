import 'package:emotion/colors.dart';
import 'package:emotion/widgets/body_text.dart';
import 'package:emotion/widgets/head_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Lottie.network(
              'https://assets5.lottiefiles.com/packages/lf20_9hmapruq.json',
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                left: screenWidth * 0.04,
              ),
              child: HeadText(
                text: 'Playing with emotions 😇',
                color: blackColor,
                multiplicationFactor: 0.07,
              ),
            ),
            Container(
                padding: const EdgeInsets.all(30),
                child: const BodyText(
                    bodyText:
                        'Presenting a sofisticated machine learning model to detect your stress level, and then using the data to make your mood better and lower down your stress level.'))
          ],
        ),
      )),
    );
  }
}
