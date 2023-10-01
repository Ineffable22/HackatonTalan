import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hackaton/providers/PushInfo.dart';
import 'package:provider/provider.dart';

class LocalNot {
  static final _notification = FlutterLocalNotificationsPlugin();
  static void init() {
    _notification.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(),
      ),
    );
  }

  static pushNotification(
      RemoteMessage message,
      ) async {

    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'channed id',
      'channel name',
      channelDescription: 'channel description',
      importance: Importance.max,
      priority: Priority.high,
    );
    var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
    PushInfo.context!.read<PushInfo>().checkForData();
    await _notification.show(
        0,
        //message.notification.body

        message.notification!.title,
        "Tap for more info",
        platformChannelSpecifics);
  }
}