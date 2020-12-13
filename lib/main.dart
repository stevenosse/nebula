import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nebula/core/my_app.dart';
import 'package:nebula/core/providers/theme_provider.dart';
import 'package:nebula/core/resources/dio_wrapper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Initializing DotEnv plugin
  await DotEnv().load('.env');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}
