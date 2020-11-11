import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nebula/core/routes.dart';
import 'package:nebula/core/utils/networker.dart';
import 'package:nebula/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: DotEnv().env['APP_NAME'],
      theme: context.watch<ThemeProvider>().appTheme,
      routes: routes,
      navigatorKey: worker.navigatorKey,
    );
  }
}
