// ignore_for_file: await_only_futures, use_key_in_widget_constructors, prefer_const_constructors

import 'package:admin_smarcap/Screen/LogIn/login_binding.dart';
import 'package:admin_smarcap/Screen/LogIn/loginpage.dart';
import 'package:admin_smarcap/Screen/OnBoard/binding/onboard_binding.dart';
import 'package:admin_smarcap/Screen/OnBoard/view/onboard_view.dart';
import 'package:admin_smarcap/Screen/SignUp/signUpView.dart';
import 'package:admin_smarcap/Screen/splash/splash_binding.dart';
import 'package:admin_smarcap/Screen/splash/splash_view.dart';
import 'package:admin_smarcap/Services/settings_service.dart';
import 'package:admin_smarcap/Services/translation_service.dart';
import 'package:admin_smarcap/Utilities/RoutesManagement/pages.dart';
import 'package:admin_smarcap/globalvariabels.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'Screen/mainPage/MainPage.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

final GetStorage globalStorage = GetStorage();
bool? firstTime;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Get.putAsync(() => SettingsService().init());
  LogInBinding().dependencies();
  SplashBinding().dependencies();
  OnBoardBinding().dependencies();
  await GetStorage.init();
  currentFirebaseUser = FirebaseAuth.instance.currentUser;
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print(fcmToken);
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    firstTime = globalStorage.read('firstTimeOpen');
    print(firstTime);
    return GetMaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      translations: TranslationService(),
      locale: SettingsService().getLocale(),
      fallbackLocale: TranslationService.fallbackLocale,
      theme: Get.find<SettingsService>().getLightTheme(),
      getPages: AppPages.routes,
      home: firstTime == null ? OnBoardView() : const SplashView(),
      routes: {
        SignUpView.id: (context) => SignUpView(),
        LoginPage.id: (context) => const LoginPage(),
        MainPageView.id: (context) => MainPageView(),
      },
    );
  }
}
