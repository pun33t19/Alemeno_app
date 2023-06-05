import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_bruno_puneet_shetty/theme/pallete.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "GOOD JOB",
          style: GoogleFonts.lilitaOne(
              fontSize: 48, color: Pallete.greenColor, letterSpacing: 3),
        ),
      ),
    );
  }
}
