import 'package:emotion/colors.dart';
import 'package:emotion/widgets/head_text.dart';
import 'package:emotion/widgets/text_field.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final respirationRateController = TextEditingController();
  final bodyTemperaturController = TextEditingController();
  final bloodOxygenController = TextEditingController();
  final sleepingHoursController = TextEditingController();
  final heartRateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:  const Color(0XFFcce3de),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: HeadText(
                text: 'Stress Meter',
                color: blackColor,
                multiplicationFactor: 0.1,
              ),
            ),
            CustomTextField(controller: respirationRateController, hintText: 'Enter respiration rate'),
            CustomTextField(controller: bodyTemperaturController, hintText: 'Enter body temperature'),
            CustomTextField(controller: bloodOxygenController, hintText: 'Enter blood oxygen %'),
            CustomTextField(controller: sleepingHoursController, hintText: 'Enter your sleeping hour'),
            CustomTextField(controller: heartRateController, hintText: 'Enter your heart rate'),
          ],
        ),
      )),
    );
  }
}
