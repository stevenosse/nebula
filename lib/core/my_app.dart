import 'package:flutter/material.dart';
import 'package:nebula/core/routes.dart';
import 'package:nebula/core/utils/constants.dart';
import 'package:nebula/core/utils/networker.dart';
import 'package:nebula/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      theme: context.watch<ThemeProvider>().appTheme,
      routes: routes,
      navigatorKey: worker.navigatorKey,
    );
  }
}