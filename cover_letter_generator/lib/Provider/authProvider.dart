import 'package:cover_letter_generator/Screens/Login.dart';
import 'package:cover_letter_generator/model/User.dart';
import 'package:cover_letter_generator/screens/Home.dart';
import 'package:cover_letter_generator/services/Auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthState {
  bool isAuthenticated = false;
  User currentUser =
      User(id: 0, email: '', password: '', firstName: '', lastName: '');
  AuthState({required this.isAuthenticated, required this.currentUser});
}

class AuthProvider extends StateNotifier<AuthState> {
  AuthProvider()
      : super(AuthState(
            isAuthenticated: false,
            currentUser: User(
                id: 0, email: '', password: '', firstName: '', lastName: ''))) {
    _initializeAuthState();
  }

  Future<void> _initializeAuthState() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('jwt_token');

    if (token != null && token.isNotEmpty) {
      state = AuthState(isAuthenticated: true, currentUser: state.currentUser);
    } else {
      state = AuthState(
          isAuthenticated: false,
          currentUser: User(
              id: 0, email: '', password: '', firstName: '', lastName: ''));
    }
  }

  Future<void> login(
    BuildContext context,
    User user,
    AuthService authService,
  ) async {
    try {
      var token = await authService.signIn(user);

      if (token.isNotEmpty) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('jwt_token', token);
        state = AuthState(
            isAuthenticated: true,
            currentUser: await authService.getCurrentUser());
      } else {
        throw Exception('Invalid token received');
      }
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('jwt_token');
    state = AuthState(
        isAuthenticated: false,
        currentUser:
            User(id: 0, email: '', password: '', firstName: '', lastName: ''));
  }
}

// Future<void> checkAuthentication(WidgetRef ref) async {
//   final prefs = await SharedPreferences.getInstance();
//   String? token = prefs.getString('jwt_token');

//   if (token != null && token.isNotEmpty) {
//     ref.read(authStateProvider.notifier).state = true;
//   } else {
//     ref.read(authStateProvider.notifier).state = false;
//   }
// }

// Logout function to clear the token and update auth state

final authInfoProvider =
    StateNotifierProvider<AuthProvider, AuthState>((ref) => AuthProvider());
