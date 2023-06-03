import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hungry_bruno_puneet_shetty/theme/pallete.dart';

class CircularButton extends StatelessWidget {
  final String icon;
  final VoidCallback onClick;
  final Size size;
  const CircularButton(
      {super.key,
      required this.icon,
      required this.onClick,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          onClick();
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Pallete.greenColor,
            minimumSize: size,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60))),
        child: Image.asset(
          icon,
          height: 20,
        ));
  }
}
