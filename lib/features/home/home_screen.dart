import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_bruno_puneet_shetty/common/widgets/primary_button.dart';
import 'package:hungry_bruno_puneet_shetty/theme/pallete.dart';
import 'package:lottie/lottie.dart';
import 'package:routemaster/routemaster.dart';

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
            PrimaryButton(
                text: "Share your meal",
                width: 188,
                height: 50,
                onClick: () => Routemaster.of(context)
                    .push(Constants.landClickScreenRoute)),
            const SizedBox(
              height: 92,
            )
          ],
        ),
      ),
    );
  }
}
