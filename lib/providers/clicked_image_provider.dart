import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class ClickedImageProvider extends ChangeNotifier {
  XFile? image;

  void setImage(XFile imageFile) {
    image = imageFile;
  }
}
