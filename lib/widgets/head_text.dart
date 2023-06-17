import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadText extends StatelessWidget {
  final String text;
  final Color color;
  final double multiplicationFactor;
  const HeadText({
    required this.text,
    required this.color,
    required this.multiplicationFactor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Text(
      text,
      style: GoogleFonts.leagueSpartan(
        color: color,
        fontSize: screenWidth * multiplicationFactor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
