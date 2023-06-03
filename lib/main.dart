import 'package:flutter/material.dart';
import 'package:hungry_bruno_puneet_shetty/providers/camera_provider.dart';
import 'package:hungry_bruno_puneet_shetty/router.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

import 'theme/pallete.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CameraProvider())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: Pallete.lightModeAppTheme,
      routeInformationParser: const RoutemasterParser(),
      routerDelegate:
          RoutemasterDelegate(routesBuilder: (context) => AppRouter.routes),
    );
  }
}
