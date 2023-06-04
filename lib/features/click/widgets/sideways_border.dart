import 'package:flutter/material.dart';
import 'package:hungry_bruno_puneet_shetty/theme/pallete.dart';

class SidewaysBorder extends StatelessWidget {
  const SidewaysBorder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 32,
            width: 5,
            decoration: BoxDecoration(
              color: Pallete.greenColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
            )),
        const Spacer(),
        Container(
            height: 32,
            width: 5,
            decoration: BoxDecoration(
              color: Pallete.greenColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            )),
      ],
    );
  }
}
