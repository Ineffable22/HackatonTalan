import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hackaton/firebase_options.dart';
import 'package:hackaton/providers/PushInfo.dart';
import 'package:hackaton/providers/login.dart';
import 'package:hackaton/providers/register.dart';
import 'package:hackaton/screens/home.dart';
import 'package:hackaton/screens/registerMap.dart';
import 'package:hackaton/screens/login.dart';
import 'package:hackaton/screens/register.dart';
import 'package:hackaton/utils/localNotification.dart';
import 'package:hackaton/utils/notification.dart';
import 'package:hackaton/utils/routingTransition.dart';
import 'package:hackaton/widgets/input.dart';
import 'package:hackaton/widgets/login.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

void main() async{
  final GoogleMapsFlutterPlatform platform = GoogleMapsFlutterPlatform.instance;
  // Default to Hybrid Composition for the example.
  (platform as GoogleMapsFlutterAndroid).useAndroidViewSurface = true;
  initializeMapRenderer();


  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
  //
  FirebaseApi firebase = FirebaseApi();
  await firebase.initNotifications();
  await FirebaseMessaging.instance.subscribeToTopic("topic");
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  firebase.notificationHandler();
  LocalNot.init();


  runApp(

      MultiProvider(
        providers: [
          Provider(create: (_) => UserLogin()),
          ChangeNotifierProvider(create: (_) => UserRegister()),
          ChangeNotifierProvider(create: (_) => PushInfo())
        ],
        child: const MyApp(),
  ));
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  LocalNot.pushNotification(message);
}

Completer<AndroidMapRenderer?>? _initializedRendererCompleter;

/// Initializes map renderer to the `latest` renderer type.
///
/// The renderer must be requested before creating GoogleMap instances,
/// as the renderer can be initialized only once per application context.
Future<AndroidMapRenderer?> initializeMapRenderer() async {
  if (_initializedRendererCompleter != null) {
    return _initializedRendererCompleter!.future;
  }

  final Completer<AndroidMapRenderer?> completer =
  Completer<AndroidMapRenderer?>();
  _initializedRendererCompleter = completer;

  WidgetsFlutterBinding.ensureInitialized();

  final GoogleMapsFlutterPlatform platform = GoogleMapsFlutterPlatform.instance;
  unawaited((platform as GoogleMapsFlutterAndroid)
      .initializeWithRenderer(AndroidMapRenderer.latest)
      .then((AndroidMapRenderer initializedRenderer) =>
      completer.complete(initializedRenderer)));

  return completer.future;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: const CupertinoThemeData(brightness: Brightness.light),
      home: const LogInScreen(),
      routes: {
        "register": (context) => RegisterScreen(),
        "register-map": (context) => RegisterMap(),
        "home": (context) => Home(),
      },
    );
  }
}




