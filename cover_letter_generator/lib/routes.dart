import 'package:cover_letter_generator/screens/Home.dart';
import 'package:cover_letter_generator/screens/Login.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  '/login': (context) => const Login(),
  '/home': (context) => const HomeScreen(),
  // Add other routes as needed
};
