import 'dart:io';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hungry_bruno_puneet_shetty/common/constants.dart';
import 'package:hungry_bruno_puneet_shetty/providers/notifications_provider.dart';
import 'package:hungry_bruno_puneet_shetty/providers/score_provider.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

class ClickedImageProvider extends ChangeNotifier {
  XFile? image;

  void setImage(XFile imageFile) {
    image = imageFile;
  }

  void addToStorage(BuildContext context) async {
    final ref = FirebaseStorage.instance
        .ref("foodImages/image${Random().nextInt(1 << 32)}");

    try {
      ref.putFile(File(image!.path)).snapshotEvents.listen((taskSnapshot) {
        switch (taskSnapshot.state) {
          case TaskState.running:
            // ...
            break;
          case TaskState.paused:
            // ...
            break;
          case TaskState.success:
            Provider.of<NotificationsProvider>(context, listen: false)
                .showNotification();
            Provider.of<ScoreProvider>(context, listen: false).incrementScore();
            Routemaster.of(context).push(Constants.messageScreenRoute);
            break;
          case TaskState.canceled:
            // ...
            break;
          case TaskState.error:
            // ...
            break;
        }
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
