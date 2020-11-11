import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBar {
  setColor({BuildContext context}) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: Theme.of(context).brightness,
        statusBarColor: Theme.of(context).accentColor,
        statusBarIconBrightness: Theme.of(context).brightness == Brightness.light ? Brightness.dark : Brightness.light,
      ),
    );
  }
}

final StatusBar statusBar = StatusBar();