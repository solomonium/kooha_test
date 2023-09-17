import 'package:flutter/material.dart';
import 'package:kooha_test/utils/helpers/in_app_notification.dart';

class MyRoutes {
  final GlobalKey<NavigatorState> navKey = GlobalKey();
  final GlobalKey<InAppNotificationState> notifyKey = GlobalKey();

  final String baseUrl = 'https://dev-api.kooha.com/v1/';
  final String imageUrl = 'https://kooha-mobile-files.s3.amazonaws.com/';

  NavigatorState? get nav => navKey.currentState;
}
