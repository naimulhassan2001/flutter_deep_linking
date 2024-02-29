import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deep_linking/core/app_route.dart';
import 'package:get/get.dart';

/// [DynamicLinkService]
class DynamicLinkService {
  static final DynamicLinkService _singleton = DynamicLinkService._internal();

  DynamicLinkService._internal();

  static DynamicLinkService get instance => _singleton;

  // Create new dynamic link
  createDynamicLink() async {
    final dynamicLinkParams = DynamicLinkParameters(
        link: Uri.parse("https://flutterdeepdemo.page.link.com?screen=details"),
        uriPrefix: "https://flutterdeepdemo.page.link",
        androidParameters: const AndroidParameters(
            packageName: "com.example.flutter_deep_linking"),
        iosParameters: const IOSParameters(
            bundleId: "com.example.flutter_deep_linking",
            minimumVersion: "0",
            appStoreId: '6473281791'));
    final dynamicLink =
        await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams);

    debugPrint("shortUrl ===========================> ${dynamicLink.shortUrl}");

    return dynamicLink.shortUrl.toString();
  }

  Future<void> initDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      // Navigator.pushNamed(context, dynamicLinkData.link.path);

      Map<String, String> param = dynamicLinkData.link.queryParameters;

      String receivedCode = param['screen'] ?? " ";
      String productId = param['productId'] ?? " ";

      if (receivedCode == "details") {
        Get.toNamed(AppRoute.home);
      }

      print(
          "=========================================>receivedCode ${receivedCode}");
      print("=========================================>productId ${productId}");
    }).onError((error) {
      print('onLink error');
      print(error.message);
    });
  }
}
