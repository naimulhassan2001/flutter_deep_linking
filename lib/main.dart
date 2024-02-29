import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_deep_linking/core/app_route.dart';
import 'package:flutter_deep_linking/services/context_utility.dart';
import 'package:flutter_deep_linking/services/deep_linking_service.dart';
import 'package:flutter_deep_linking/services/uni_links_services.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UniLinksService.init() ;
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
  void initState() {
    // TODO: implement initState
    DynamicLinkService.instance.initDynamicLinks() ;
    super.initState();
  }

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
