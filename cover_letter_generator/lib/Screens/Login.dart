import 'package:cover_letter_generator/Widgets/LoginForm.dart';
import 'package:cover_letter_generator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    final height = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: height * 0.02),
            const Text(
              "Login",
              style: TextStyle(fontSize: 22, color: primaryColor),
            ),
            SizedBox(height: height * 0.04),
            SvgPicture.asset(
              "assets/job_hunt.svg",
              height: height * 0.25,
              width: width * 0.9,
            ),
            SizedBox(height: height * 0.03),
            const Flexible(
              child: SingleChildScrollView(
                child: LoginForm(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
