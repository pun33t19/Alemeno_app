import 'package:flutter/material.dart';

class ScoreProvider extends ChangeNotifier {
  int score = 0;

  void incrementScore() {
    score += 10;
  }
}
