import 'package:flutter/material.dart';

extension NavigationExtensions on BuildContext {
  Future<dynamic> navigate(String uri, {Map<String, dynamic> arguments, bool replace = false}) {
    return replace ? 
      Navigator.of(this).pushReplacementNamed(uri, arguments: arguments) : 
      Navigator.of(this).pushNamed(uri, arguments: arguments);
  }

  get args => ModalRoute.of(this).settings.arguments as Map;
}
