import 'package:flutter/material.dart';
import 'package:hungry_bruno_puneet_shetty/features/home/home_screen.dart';

import 'theme/pallete.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Pallete.lightModeAppTheme,
      home: const HomeScreen(),
    );
  }
}
