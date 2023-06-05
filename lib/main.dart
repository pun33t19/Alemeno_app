import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hungry_bruno_puneet_shetty/providers/camera_provider.dart';
import 'package:hungry_bruno_puneet_shetty/providers/clicked_image_provider.dart';
import 'package:hungry_bruno_puneet_shetty/router.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

import 'firebase_options.dart';
import 'theme/pallete.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CameraProvider()),
        ChangeNotifierProvider(create: (_) => ClickedImageProvider())
      ],
      child: MyApp(
        camera: firstCamera,
      )));
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;

  const MyApp({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    Provider.of<CameraProvider>(context, listen: false).setCamera(camera);

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: Pallete.lightModeAppTheme,
      routeInformationParser: const RoutemasterParser(),
      routerDelegate:
          RoutemasterDelegate(routesBuilder: (context) => AppRouter.routes),
    );
  }
}
