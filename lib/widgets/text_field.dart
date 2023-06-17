import 'package:emotion/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const CustomTextField({
    required this.controller,
    required this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1, vertical: screenWidth * 0.04),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: controller,
        style:  TextStyle(color: blackColor),
        decoration: InputDecoration(
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: lightPink, width: 1),
              borderRadius: BorderRadius.circular(25)),
          // focusColor: greyColor,
          fillColor: greyColor,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            color: blackColor,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
