import 'package:flutter/material.dart';
import 'package:hungry_bruno_puneet_shetty/common/constants.dart';
import 'package:hungry_bruno_puneet_shetty/common/widgets/circular_button.dart';
import 'package:hungry_bruno_puneet_shetty/common/widgets/primary_text.dart';
import 'package:hungry_bruno_puneet_shetty/features/share/widgets/sideways_border.dart';
import 'package:hungry_bruno_puneet_shetty/features/share/widgets/top_camera_border.dart';
import 'package:hungry_bruno_puneet_shetty/theme/pallete.dart';
import 'package:lottie/lottie.dart';
import 'package:routemaster/routemaster.dart';

import '../widgets/common_image.dart';

class LandClickScreen extends StatefulWidget {
  const LandClickScreen({super.key});

  @override
  State<LandClickScreen> createState() => _LandClickScreenState();
}

class _LandClickScreenState extends State<LandClickScreen> {
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
                padding: const EdgeInsets.symmetric(horizontal: 27),
                decoration: BoxDecoration(
                    color: Pallete.cardColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 80),
                          child: CommonImage(
                            imageAddress: Constants.forkImageAddress,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: 220,
                          height: 207,
                          margin: const EdgeInsets.only(top: 53),
                          child: Column(
                            children: [
                              const TopCameraBorder(),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SidewaysBorder(),
                                    Container(
                                      width: 200,
                                      height: 200,
                                      decoration: BoxDecoration(
                                          color: Pallete.cameraCardColor,
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                    ),
                                    const SidewaysBorder()
                                  ],
                                ),
                              ),
                              const TopCameraBorder()
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 80),
                          child: CommonImage(
                            imageAddress: Constants.spoonImageAddress,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const PrimaryText(text: "Click your Meal", fontSize: 24),
                    const SizedBox(
                      height: 20,
                    ),
                    CircularButton(
                        icon: Constants.cameraImageAddress,
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
