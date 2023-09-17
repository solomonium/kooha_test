import 'package:flutter/material.dart';
import 'package:kooha_test/export.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Corners.s20),
            topRight: Radius.circular(Corners.s20),
          ),
          child: const BottomNav()),
      body: Consumer<HomeProvider>(builder: (context, store, child) {
        return IndexedStack(
          index: store.navIndex,
          children: const [
            Browse(),
            Bookings(),
            Inbox(),
            Profile(),
          ],
        );
      }),
    );
  }
}
