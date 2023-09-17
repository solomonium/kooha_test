// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:kooha_test/export.dart';

class BrowseCmd extends BaseCommand {
  BrowseCmd(super.c);
  BrowseProvider get featured => getProvider<BrowseProvider>();
  BrowseProvider get trending => getProvider<BrowseProvider>();
  BrowseProvider get details => getProvider<BrowseProvider>();
  AuthProvider get auth => getProvider<AuthProvider>();

  Future<void> getFeaturedCeleb() async {
    Response? res;
    BrowseServices service = BrowseServices();
    BuildContext ctx = rootNav!.context;

    res = await service.getFeaturedCeleb(token: auth.token);
    if (res != null) {
      if (res.statusCode! >= 200 && res.statusCode! < 300) {
        var resData = res.data['data']['records'];
        featured.listOfFeaturedModel = List<Map<String, dynamic>>.from(resData);
        safePrint(resData);
      } else if (res.statusCode! >= 400 && res.statusCode! < 500) {
        ctx.showInAppNotification(res.data['message']);
      } else {
        ctx.showInAppNotification('Something Happened');
      }
    } else {
      safePrint("error occurred  class BrowseCmd line 32");
    }
  }

  Future<void> getTrendingCeleb() async {
    Response? res;
    BrowseServices service = BrowseServices();
    BuildContext ctx = rootNav!.context;

    res = await service.getTrendingCeleb(token: auth.token);
    if (res != null) {
      if (res.statusCode! >= 200 && res.statusCode! < 300) {
        var resData = res.data['data']['records'];
        trending.listOfTrendingCelebModel =
            List<Map<String, dynamic>>.from(resData);
        safePrint(resData);
      } else if (res.statusCode! >= 400 && res.statusCode! < 500) {
        ctx.showInAppNotification(res.data['message']);
      } else {
        ctx.showInAppNotification('Something Happened');
      }
    } else {
      safePrint("error occurred  class BrowseCmd line 32");
    }
  }

  Future<void> getCelebById(String id) async {
    Response? res;
    BrowseServices service = BrowseServices();
    BuildContext ctx = rootNav!.context;

    res = await service.getCelebById(id, token: auth.token);
    if (res != null) {
      if (res.statusCode! >= 200 && res.statusCode! < 300) {
        var resData = res.data as Map<String, dynamic>;
        details.celebDetails = CelebByIdModel.fromJson(resData);
        safePrint(resData);
      } else if (res.statusCode! >= 400 && res.statusCode! < 500) {
        ctx.showInAppNotification(res.data['message']);
      } else {
        ctx.showInAppNotification('Something Happened');
      }
    } else {
      safePrint("error occurred  class BrowseCmd line 32");
    }
  }
}
