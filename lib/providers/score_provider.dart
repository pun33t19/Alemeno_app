import 'package:flutter/material.dart';

class ScoreProvider extends ChangeNotifier {
  int score = 10;

  void incrementScore() {
    score += 10;
  }
}
