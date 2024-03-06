import 'package:cover_letter_generator/Screens/HomeScreen.dart';
import 'package:cover_letter_generator/utils/colors.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Form(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: width * 0.15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Username',
                  style: TextStyle(color: Color.fromARGB(255, 152, 152, 152)),
                ),
                SizedBox(height: height * 0.005),
                TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: height * 0, horizontal: width * 0.03),
                    labelText: 'Username',
                    labelStyle: const TextStyle(
                        fontSize: 13,
                        color: Color.fromARGB(255, 157, 157, 157)),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFFC0C0C0)),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.02),
          Container(
            margin: EdgeInsets.symmetric(horizontal: width * 0.15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Password',
                  style: TextStyle(color: Color.fromARGB(255, 152, 152, 152)),
                ),
                SizedBox(height: height * 0.005),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: height * 0.01, horizontal: width * 0.03),
                    labelText: 'Password',
                    labelStyle: const TextStyle(
                        fontSize: 13,
                        color: Color.fromARGB(255, 157, 157, 157)),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Color(0xFFC0C0C0)),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.03),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: width * 0.65,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return  HomeScreen();
                      },
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: EdgeInsets.symmetric(
                        horizontal: 50, vertical: height * 0.018),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: height * 0.01),
              const Text(
                'Forgot Password ?',
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: height * 0.01),
            ],
          ),
          SizedBox(height: height * 0.02),
          const Text(
            'Or login with ',
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(height: height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.facebook),
              SizedBox(width: width * 0.03),
              const Icon(Icons.facebook)
            ],
          )
        ],
      ),
    );
  }
}
