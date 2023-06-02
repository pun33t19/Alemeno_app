import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_bruno_puneet_shetty/common/widgets/primary_button.dart';
import 'package:hungry_bruno_puneet_shetty/theme/pallete.dart';
import 'package:lottie/lottie.dart';

import '../../common/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "Feed Bruno",
              style: GoogleFonts.andika(fontSize: 25, color: Pallete.textColor),
            ),
            Center(child: Lottie.asset(Constants.catHomePageAnimationAddress)),
            const Spacer(),
            const PrimaryButton(
                text: "Share your meal", width: 188, height: 50),
            const SizedBox(
              height: 92,
            )
          ],
        ),
      ),
    );
  }
}
