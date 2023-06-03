import 'package:flutter/material.dart';

import 'package:hungry_bruno_puneet_shetty/common/constants.dart';

class CommonImage extends StatelessWidget {
  final String imageAddress;

  const CommonImage({super.key, required this.imageAddress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 50,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(imageAddress))),
    );
  }
}
