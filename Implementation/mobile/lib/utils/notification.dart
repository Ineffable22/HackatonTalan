import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hackaton/providers/PushInfo.dart';
import 'package:hackaton/utils/localNotification.dart';


class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();

    print("fcmToken");
    print(fcmToken);
  }

  void notificationHandler() {


    FirebaseMessaging.onMessage.listen((event) async {
      //await NotificationApi.pushNotification(event);
      PushInfo.setData(jsonDecode(event.notification!.body!));
      print(event);
      print(event.notification!.body);

      LocalNot.pushNotification(event);
    });
  }
}