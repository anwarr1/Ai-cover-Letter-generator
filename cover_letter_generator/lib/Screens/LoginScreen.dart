// stf
import 'package:cover_letter_generator/Widgets/LoginForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.red,
              height: height * 0.08,
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Text("Login"),
            SizedBox(
              height: height * 0.04,
            ),
            SvgPicture.asset(
              "assets/job_hunt.svg",
              height: height * 0.3,
              width: width * 0.9,
            ),
            SizedBox(height: height * 0.03),
            Expanded(child: SingleChildScrollView(child: LoginForm()))
          ],
        ),
      ),
    );
  }
}
