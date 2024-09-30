import 'package:cover_letter_generator/provider/authProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cover_letter_generator/screens/Login.dart';

class Protectedroute extends ConsumerWidget {
  final Widget child;

  const Protectedroute({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthenticated = ref.watch(authStateProvider);

    if (isAuthenticated) {
      return child;
    } else {
      return const Login();
    }
  }
}
