import 'package:cover_letter_generator/provider/authProvider.dart';
import 'package:cover_letter_generator/screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cover_letter_generator/screens/Login.dart';

class Protectedroute extends ConsumerWidget {
  final Widget child;

  const Protectedroute({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthenticated = ref.watch(authInfoProvider).isAuthenticated;

    if (isAuthenticated) {
      if (child is Login) {
        return const HomeScreen();
      }
      return child;
    } else {
      return const Login();
    }
  }
}
