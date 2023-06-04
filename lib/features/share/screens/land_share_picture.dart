import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hungry_bruno_puneet_shetty/common/constants.dart';
import 'package:hungry_bruno_puneet_shetty/common/widgets/circular_button.dart';
import 'package:hungry_bruno_puneet_shetty/common/widgets/primary_text.dart';

import 'package:hungry_bruno_puneet_shetty/providers/clicked_image_provider.dart';
import 'package:hungry_bruno_puneet_shetty/theme/pallete.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

class LandShareScreen extends StatefulWidget {
  const LandShareScreen({super.key});

  @override
  State<LandShareScreen> createState() => _LandShareScreenState();
}

class _LandShareScreenState extends State<LandShareScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 24),
              child: CircularButton(
                  icon: Constants.arrowImageAddress,
                  size: const Size(45, 45),
                  onClick: () {
                    Routemaster.of(context).pop();
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
                child: Lottie.asset(Constants.cuteTigerAnimationAddress,
                    height: 200)),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 27),
                decoration: BoxDecoration(
                    color: Pallete.cardColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(
                  children: [
                    Consumer<ClickedImageProvider>(
                      builder: (context, imageFile, child) {
                        return Container(
                          width: 200,
                          height: 200,
                          margin: const EdgeInsets.only(top: 57),
                          decoration: BoxDecoration(
                              color: Pallete.cameraCardColor,
                              borderRadius: BorderRadius.circular(100)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Image.file(
                                    File(imageFile.image!.path),
                                    fit: BoxFit.cover,
                                  ))),
                        );
                      },
                    ),
                    const PrimaryText(text: "Will you eat this?", fontSize: 24),
                    const SizedBox(
                      height: 20,
                    ),
                    CircularButton(
                        icon: Constants.tickImageAddress,
                        onClick: () {},
                        size: const Size(60, 60))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
