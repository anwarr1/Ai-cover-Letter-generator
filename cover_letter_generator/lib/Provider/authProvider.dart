import 'dart:convert';

import 'package:cover_letter_generator/Screens/Login.dart';
import 'package:cover_letter_generator/model/User.dart';
import 'package:cover_letter_generator/services/Auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthState {
  bool isAuthenticated;
  bool isLoading;
  User currentUser;

  AuthState({
    required this.isAuthenticated,
    required this.isLoading,
    required this.currentUser,
  });
}

class AuthProvider extends StateNotifier<AuthState> {
  AuthProvider()
      : super(AuthState(
            isAuthenticated: false,
            isLoading: true,
            currentUser: User(
                id: 0, email: '', password: '', firstName: '', lastName: ''))) {
    _initializeAuthState();
  }

  Future<void> _initializeAuthState() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('jwt_token');
    String? currentUser = prefs.getString('user');
    print("init : $currentUser ");
    if (token != null && token.isNotEmpty) {
      state = AuthState(
          isAuthenticated: true,
          isLoading: false,
          currentUser: User.fromJson(jsonDecode(currentUser!)));
    } else {
      state = AuthState(
          isAuthenticated: false,
          isLoading: false,
          currentUser: state.currentUser);
    }
  }

  Future<void> login(
      BuildContext context, User user, AuthService authService) async {
    try {
      var token = await authService.signIn(user);
      if (token.isNotEmpty) {
        user = await authService.getCurrentUser();
        state = AuthState(
            isAuthenticated: true, isLoading: false, currentUser: user);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('jwt_token', token);
        await prefs.setString('user', jsonEncode(user.toJson()));
       
      } else {
        throw Exception('Invalid token received');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('jwt_token');
    await prefs.remove('user');
    state = AuthState(
        isAuthenticated: false,
        isLoading: false,
        currentUser:
            User(id: 0, email: '', password: '', firstName: '', lastName: ''));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    );
  }

 
}

final authInfoProvider =
    StateNotifierProvider<AuthProvider, AuthState>((ref) => AuthProvider());
