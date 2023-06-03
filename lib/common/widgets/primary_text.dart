import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_bruno_puneet_shetty/theme/pallete.dart';

class PrimaryText extends StatelessWidget {
  final String text;
  final double fontSize;

  const PrimaryText({super.key, required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.andika(fontSize: fontSize, color: Pallete.textColor),
    );
  }
}
