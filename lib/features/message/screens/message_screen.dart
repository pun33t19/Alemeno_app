import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_bruno_puneet_shetty/common/widgets/primary_button.dart';
import 'package:hungry_bruno_puneet_shetty/theme/pallete.dart';
import 'package:routemaster/routemaster.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "GOOD JOB",
              style: GoogleFonts.lilitaOne(
                  fontSize: 48, color: Pallete.greenColor, letterSpacing: 3),
            ),
            const SizedBox(
              height: 100,
            ),
            PrimaryButton(
                text: "Play Again",
                width: 120,
                height: 60,
                onClick: () {
                  Routemaster.of(context).popUntil((routeData) => false);
                })
          ],
        ),
      ),
    );
  }
}
