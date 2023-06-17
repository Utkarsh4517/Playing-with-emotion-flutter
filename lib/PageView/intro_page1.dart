import 'package:emotion/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          child: Center(
        child:Column(
          children: [
            
            Lottie.network('https://assets8.lottiefiles.com/packages/lf20_fvybxiki.json')
          ],
        ),
      )),
    );
  }
}
