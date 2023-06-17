import 'package:emotion/colors.dart';
import 'package:emotion/widgets/body_text.dart';
import 'package:emotion/widgets/head_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0XFFcce3de),
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Lottie.network(
              'https://assets8.lottiefiles.com/packages/lf20_bc4dpz3a.json',
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                left: screenWidth * 0.04,
              ),
              child: HeadText(
                text: 'Stress',
                color: blackColor,
                multiplicationFactor: 0.13,
              ),
            ),
            Container(
                padding: const EdgeInsets.all(30),
                child: const BodyText(
                    bodyText:
                        'In the shadows of our minds, mental stress takes hold, a relentless force that distorts reality and weighs upon our spirits. It traps us in self-imposed expectations and societal pressures, eroding our well-being. But through self-compassion, resilience, and acceptance, we can reclaim our inner strength and break free from its grip. You are not alone in this battle. Seek support, for shared burdens lighten the load. Liberation awaits within.'))
          ],
        ),
      )),
    );
  }
}
