import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

Future<void> handleBackgroundMessage(RemoteMessage msg) async {
  if (kDebugMode) {
    print('title -> ${msg.notification?.title}');
    print('body -> ${msg.notification?.body}');
    print('payload -> ${msg.data}');
  }
}

class FCM {
  final _fcm = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _fcm.requestPermission();
    final fcmToken = await _fcm.getToken();
    print('FCM Token -> $fcmToken');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    await uploadFCM(fcmToken!);
  }

  Future<void> uploadFCM(String fcm) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    await _firestore.collection('1').doc().set(
      {'fcm_token': fcm},
    );
  }
}
