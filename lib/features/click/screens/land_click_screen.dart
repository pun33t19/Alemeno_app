import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hungry_bruno_puneet_shetty/common/constants.dart';
import 'package:hungry_bruno_puneet_shetty/common/widgets/circular_button.dart';
import 'package:hungry_bruno_puneet_shetty/common/widgets/primary_text.dart';
import 'package:hungry_bruno_puneet_shetty/features/click/widgets/sideways_border.dart';
import 'package:hungry_bruno_puneet_shetty/features/click/widgets/top_camera_border.dart';
import 'package:hungry_bruno_puneet_shetty/providers/camera_provider.dart';
import 'package:hungry_bruno_puneet_shetty/providers/clicked_image_provider.dart';
import 'package:hungry_bruno_puneet_shetty/theme/pallete.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

import '../widgets/common_image.dart';

class LandClickScreen extends StatefulWidget {
  const LandClickScreen({super.key});

  @override
  State<LandClickScreen> createState() => _LandClickScreenState();
}

class _LandClickScreenState extends State<LandClickScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //get the available cameras stored from the provider
    final CameraDescription? camera =
        Provider.of<CameraProvider>(context, listen: false).camera;

    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      camera!,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

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
                padding: const EdgeInsets.symmetric(horizontal: 22),
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
                          width: 10,
                        ),
                        Container(
                          width: 210,
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
                                      child: FutureBuilder(
                                          future: _initializeControllerFuture,
                                          builder: (context, snapShot) {
                                            if (snapShot.connectionState ==
                                                ConnectionState.done) {
                                              return ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                child: AspectRatio(
                                                  aspectRatio: 1,
                                                  child: CameraPreview(
                                                      _controller),
                                                ),
                                              );
                                            } else {
                                              return const Center(
                                                  child:
                                                      CircularProgressIndicator());
                                            }
                                          }),
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
                        onClick: () async {
                          try {
                            await _initializeControllerFuture;
                            // Attempt to take a picture and get the file `image`
                            // where it was saved.
                            final image = await _controller.takePicture();

                            if (!mounted) return;

                            Provider.of<ClickedImageProvider>(context,
                                    listen: false)
                                .setImage(image);
                            Routemaster.of(context)
                                .push(Constants.landShareScreenRoute);
                          } catch (e) {
                            debugPrint(e.toString());
                          }
                        },
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
