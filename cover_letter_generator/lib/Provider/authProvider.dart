import 'package:cover_letter_generator/Screens/Login.dart';
import 'package:cover_letter_generator/model/User.dart';
import 'package:cover_letter_generator/screens/Home.dart';
import 'package:cover_letter_generator/services/Auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authStateProvider = StateProvider<bool>((ref) {
  return false; // Default to not authenticated
});

Future<void> checkAuthentication(WidgetRef ref) async {
  final prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('jwt_token');

  if (token != null && token.isNotEmpty) {
    ref.read(authStateProvider.notifier).state = true;
  } else {
    ref.read(authStateProvider.notifier).state = false;
  }
}

Future<void> login(
  BuildContext context,
  User user,
  AuthService authService,
  WidgetRef ref,
) async {
  try {
    var token = await authService.signIn(user);

    if (token.isNotEmpty) {
      ref.read(authStateProvider.notifier).state = true;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('jwt_token', token);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login Successful')),
      );

      // Navigate to the HomeScreen after successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      throw Exception('Invalid token received');
    }
  } catch (e) {
    // Display error message on failure
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: $e')),
    );
  }
}

// Logout function to clear the token and update auth state
Future<void> logout(BuildContext context, WidgetRef ref) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('jwt_token');
  ref.read(authStateProvider.notifier).state = false;
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const Login()),
  );
}
