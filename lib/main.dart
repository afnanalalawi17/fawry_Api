// import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:fawry_app/app/lang/LocalizationService.dart';
import 'package:fawry_app/app/theme/themes_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/app_pages.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'firebase_options.dart';

int? onBoarding;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().whenComplete(() {
    print("completed");
    FirebaseMessaging.instance.subscribeToTopic('fawryweather');
  });
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await AppTrackingTransparency.requestTrackingAuthorization();

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print('User granted permission: ${settings.authorizationStatus}');
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });
  await GetStorage.init();

  onBoarding = await GetStorage().read('onBoardin');
  await GetStorage().write('onBoardin', 1);
  print('onBoardin $onBoarding');
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    translations: LocalizationService(),
    title: "Application",
    initialRoute: onBoarding == 0 || onBoarding == null
        ? Routes.SELECT_LANG
        : AppPages.INITIAL,
    getPages: AppPages.routes,
    locale: Locale('ar'),
    fallbackLocale: Locale('ar'),
    theme: ThemeHelper.myTheme(),
  ));
}
