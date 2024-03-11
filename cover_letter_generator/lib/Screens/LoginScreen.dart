// stf
import 'package:cover_letter_generator/Widgets/LoginForm.dart';
import 'package:cover_letter_generator/utils/colors.dart';
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
              height: height * 0.05,
            ),
            SizedBox(
              height: height * 0.05,
            ),
            const Text("Login",
                style: TextStyle(fontSize: 22, color: primaryColor)),
            SizedBox(
              height: height * 0.04,
            ),
            SvgPicture.asset(
              "assets/job_hunt.svg",
              height: height * 0.25,
              width: width * 0.9,
            ),
            SizedBox(height: height * 0.03),
            Expanded(child: SingleChildScrollView(child: LoginForm())),
            Container(
              margin: EdgeInsets.only(bottom: height * 0.02),
              child: const Align(
                  alignment: Alignment.bottomCenter,
                  child: Text('Don\'t have an account ?',
                      style: TextStyle(fontSize: 12))),
            )
          ],
        ),
      ),
    );
  }
}
