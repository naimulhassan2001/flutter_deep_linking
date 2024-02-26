

import 'package:flutter_deep_linking/view/screen/home_screen.dart';
import 'package:flutter_deep_linking/view/screen/test.dart';
import 'package:get/get.dart';

class AppRoute {
  static const String test = "/test.dart";
    static const String home = "/home_screen.dart";









  static List<GetPage> routes = [
    GetPage(name: test, page: () => const TestScreen()),
    GetPage(name: home, page: () => const HomeScreen()),



  ];
}