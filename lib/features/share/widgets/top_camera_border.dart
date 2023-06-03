import 'package:flutter/material.dart';

import 'package:hungry_bruno_puneet_shetty/theme/pallete.dart';

class TopCameraBorder extends StatelessWidget {
  const TopCameraBorder({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 5,
          decoration: BoxDecoration(
              color: Pallete.greenColor,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
        ),
        const Spacer(),
        Container(
          width: 32,
          height: 5,
          decoration: BoxDecoration(
              color: Pallete.greenColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10))),
        )
      ],
    );
  }
}
