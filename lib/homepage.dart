import 'package:emotion/colors.dart';
import 'package:emotion/widgets/head_text.dart';
import 'package:emotion/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'dart:typed_data';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<double> inputs = [0, 0, 0, 0, 0];
  double output = 0;
  int _outputInt = 0;

  final respirationRateController = TextEditingController();
  final bodyTemperaturController = TextEditingController();
  final bloodOxygenController = TextEditingController();
  final sleepingHoursController = TextEditingController();
  final heartRateController = TextEditingController();

  late Interpreter _interpreter;
  bool isModelLoaded = false;
  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future<void> loadModel() async {
    _interpreter = await Interpreter.fromAsset('assets/model/model1.tflite');
    setState(() {
      isModelLoaded = true;
    });
  }

double runInference(List<double> inputs) {
  final inputTensors = _interpreter.getInputTensors();
  final outputTensors = _interpreter.getOutputTensors();

  if (inputTensors.isNotEmpty && outputTensors.isNotEmpty) {
    final inputType = inputTensors[0].type;
    final outputType = outputTensors[0].type;

    final inputBuffer = Float32List.fromList(inputs);
    final outputBuffer = Float32List(outputTensors[0].shape.reduce((a, b) => a * b));

    _interpreter.run(inputBuffer.buffer, outputBuffer.buffer);

    return outputBuffer[0];
  }

  return 0.0; // Return a default value or handle the error accordingly
}


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0XFFcce3de),
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
            CustomTextField(
                controller: respirationRateController,
                hintText: 'Enter respiration rate'),
            CustomTextField(
                controller: bodyTemperaturController,
                hintText: 'Enter body temperature'),
            CustomTextField(
                controller: bloodOxygenController,
                hintText: 'Enter blood oxygen %'),
            CustomTextField(
                controller: sleepingHoursController,
                hintText: 'Enter your sleeping hour'),
            CustomTextField(
                controller: heartRateController,
                hintText: 'Enter your heart rate'),
            ElevatedButton(
              onPressed: isModelLoaded
                  ? () {
                      inputs = [
                        double.tryParse(respirationRateController.text) ?? 0,
                        double.tryParse(bodyTemperaturController.text) ?? 0,
                        double.tryParse(bloodOxygenController.text) ?? 0,
                        double.tryParse(sleepingHoursController.text) ?? 0,
                        double.tryParse(heartRateController.text) ?? 0,
                      ];

                      setState(() {
                        output = runInference(inputs);
                        int outputInt = output.round();
                        _outputInt = outputInt;
                      });
                    }
                  : null,
              child: const Text('Get'),
            ),
            SizedBox(
              height: screenWidth * 0.2,
            ),
            Text(
              'Your stress level is of level : $_outputInt',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      )),
    );
  }

  @override
  void dispose() {
    _interpreter.close();
    super.dispose();
  }
}
