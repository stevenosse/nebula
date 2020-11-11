import 'package:flutter/material.dart';
import 'package:nebula/screens/home_page.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  "/": (context) => HomePage(),
};