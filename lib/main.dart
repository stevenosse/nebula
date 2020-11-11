import 'package:flutter/material.dart';
import 'package:nebula/core/my_app.dart';
import 'package:nebula/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        )
      ],
      child: MyApp(),
    ),
  );
}
