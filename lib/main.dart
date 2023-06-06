import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hungry_bruno_puneet_shetty/providers/camera_provider.dart';
import 'package:hungry_bruno_puneet_shetty/providers/clicked_image_provider.dart';
import 'package:hungry_bruno_puneet_shetty/providers/notifications_provider.dart';
import 'package:hungry_bruno_puneet_shetty/providers/score_provider.dart';
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

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  await flutterLocalNotificationsPlugin.initialize(
    const InitializationSettings(
      android: AndroidInitializationSettings(
          'launch_background'), // Replace 'app_icon' with the name of your app icon
    ),
  );

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CameraProvider()),
        ChangeNotifierProvider(create: (_) => ClickedImageProvider()),
        ChangeNotifierProvider(create: (_) => ScoreProvider()),
        ChangeNotifierProvider(create: (_) => NotificationsProvider()),
      ],
      child: MyApp(
        camera: firstCamera,
        flutterLocalNotificationsPlugin: flutterLocalNotificationsPlugin,
      )));
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  const MyApp(
      {super.key,
      required this.camera,
      required this.flutterLocalNotificationsPlugin});

  @override
  Widget build(BuildContext context) {
    Provider.of<CameraProvider>(context, listen: false).setCamera(camera);
    Provider.of<NotificationsProvider>(context, listen: false)
        .set(flutterLocalNotificationsPlugin);

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: Pallete.lightModeAppTheme,
      routeInformationParser: const RoutemasterParser(),
      routerDelegate:
          RoutemasterDelegate(routesBuilder: (context) => AppRouter.routes),
    );
  }
}
