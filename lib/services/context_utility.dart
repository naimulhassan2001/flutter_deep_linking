import 'package:flutter/cupertino.dart';

class ContextUtility {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static NavigatorState? get navigator => navigatorKey.currentState;

  static BuildContext? get context => navigator?.overlay?.context;
}
