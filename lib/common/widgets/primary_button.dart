import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_bruno_puneet_shetty/theme/pallete.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final double width, height;
  final VoidCallback onClick;

  const PrimaryButton(
      {super.key,
      required this.text,
      required this.width,
      required this.height,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onClick();
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Pallete.greenColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          minimumSize: Size(width, height)),
      child: Text(
        text,
        style: GoogleFonts.andika(fontSize: 20),
      ),
    );
  }
}
