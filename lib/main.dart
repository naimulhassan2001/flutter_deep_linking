import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_deep_linking/core/app_route.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.noTransition,
          fallbackLocale: const Locale("en", "US"),
          transitionDuration: const Duration(milliseconds: 200),
          initialRoute: AppRoute.home,
          navigatorKey: Get.key,
          getPages: AppRoute.routes,
        );     
  }
}