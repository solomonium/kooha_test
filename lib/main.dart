import 'package:flutter/material.dart';
import 'package:kooha_test/export.dart';

Future<void> main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => BrowseProvider()),
        Provider<BuildContext>(create: (c) => c),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var themeType = context.select<AppProvider, ThemeType>((val) => val.theme);

    AppTheme theme = AppTheme.fromType(themeType);
    return Provider.value(
      value: theme,
      child: ScreenUtilInit(
          designSize: const Size(430, 932),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              navigatorKey: R.N.navKey,
              title: "Kooha Test",
              theme: ThemeData.dark(),

              // theme.themeData,
              debugShowCheckedModeBanner: false,
              home: const LoginScreen(),
              builder: (context, child) => MediaQuery(
                data: context.widthPx < 600
                    ? context.mq.copyWith(textScaleFactor: .8)
                    : context.mq.copyWith(textScaleFactor: 1),
                child: InAppNotification(
                  key: R.N.notifyKey,
                  safeAreaPadding: EdgeInsets.zero,
                  minAlertHeight: 40.0,
                  child: child,
                ),
              ),
            );
          }),
    );
  }
}
