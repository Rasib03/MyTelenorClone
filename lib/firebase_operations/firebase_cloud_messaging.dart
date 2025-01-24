import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> handleBackgroundMessage(RemoteMessage msg) async {
  print('title -> ${msg.notification?.title}');
  print('body -> ${msg.notification?.body}');
  print('payload -> ${msg.data}');
}

class FCM {
  final _fcm = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _fcm.requestPermission();
    final fcmToken = await _fcm.getToken();
    print('FCM Token -> $fcmToken');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}
