import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraProvider extends ChangeNotifier {
  CameraDescription? camera;

  void setCamera(CameraDescription camera) {
    this.camera = camera;
  }
}
