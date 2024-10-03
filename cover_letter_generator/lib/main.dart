import 'package:cover_letter_generator/Screens/Login.dart';
import 'package:cover_letter_generator/provider/authProvider.dart';
import 'package:cover_letter_generator/routes.dart';
import 'package:cover_letter_generator/screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(66, 47, 126, 1)),
        useMaterial3: true,
      ),
      home: Consumer(
        builder: (context, ref, child) {
          final authState = ref.watch(authInfoProvider);
          return authState.isAuthenticated ? HomeScreen() : Login();
        },
      ),
      routes: routes,
      builder: (context, child) {
        return child!;
      },
    );
  }
}
