import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsProvider extends ChangeNotifier {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void set(FlutterLocalNotificationsPlugin localNotificationsPlugin) {
    flutterLocalNotificationsPlugin = localNotificationsPlugin;
  }

  Future<void> showNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'hungry_bruno_channel', // Replace with your own channel ID
      'hungry_bruno', // Replace with your own channel name

      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      'Meal fed successFully!', // Notification title
      'Thank you for sharing food with me', // Notification body
      platformChannelSpecifics,
    );
  }
}
