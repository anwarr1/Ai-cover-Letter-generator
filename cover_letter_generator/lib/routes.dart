import 'package:cover_letter_generator/screens/Home.dart';
import 'package:cover_letter_generator/screens/Login.dart';
import 'package:cover_letter_generator/screens/ProtectedRoute.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  '/login': (context) => const Protectedroute(child: Login()),
  '/home': (context) => const Protectedroute(child: HomeScreen()),
  // Add other routes as needed
};
