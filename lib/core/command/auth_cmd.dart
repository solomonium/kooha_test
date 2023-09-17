// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:kooha_test/export.dart';

class AuthCmd extends BaseCommand {
  AuthCmd(super.c);
  AuthProvider get auth => getProvider<AuthProvider>();

  Future<void> login(model) async {
    BuildContext ctx = rootNav!.context;
    AuthServices services = AuthServices();

    Response? res = await services.login(model);

    safePrint(res?.data);
    if (res != null) {
      safePrint(res.statusCode);
      if (res.statusCode! >= 200 && res.statusCode! < 300) {
        Map<String, dynamic> data = res.data;
        safePrint(res.statusCode);

        var token = data['data']['token'];
        log(data['data']['token']);
        SharedPrefs.setString('token', token);
        auth.userToken = token;

        ctx.showInAppNotification(data['message'],
            type: InAppNotificationType.success);
        ctx.push(const MainScreen());
      } else if (res.statusCode! >= 400 && res.statusCode! < 500) {
        ctx.showInAppNotification(res.data['message']);
      } else {
        ctx.showInAppNotification('Something Happened');
      }
    }
  }
}
