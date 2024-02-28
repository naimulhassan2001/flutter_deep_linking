import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

/// [DynamicLinkService]
class DynamicLinkService {
  static final DynamicLinkService _singleton = DynamicLinkService._internal();

  DynamicLinkService._internal();

  static DynamicLinkService get instance => _singleton;

  // Create new dynamic link
  Future<void> createDynamicLink() async {
    final dynamicLinkParams = DynamicLinkParameters(
      link: Uri.parse("https://flutterdeepdemo.page.link.com/?code=red"),
      uriPrefix: "https://flutterdeepdemo.page.link",
      androidParameters:
          const AndroidParameters(packageName: "com.example.flutter_deep_linking"),
    );
    final dynamicLink =
        await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams);

    debugPrint("shortUrl ===========================> ${dynamicLink.shortUrl}");
  }
}
