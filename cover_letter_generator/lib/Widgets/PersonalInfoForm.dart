import 'package:cover_letter_generator/Screens/HomeScreen.dart';
import 'package:cover_letter_generator/utils/colors.dart';
import 'package:flutter/material.dart';

class PersonalInfoForm extends StatelessWidget {
  double height, width;
  // PageController pageController;
  Color col;
  PersonalInfoForm(this.width, this.height, this.col);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: col,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(10),
            child: const Text(
              "Personal Information",
              style: TextStyle(
                color: primaryColor,
              ),
            ),
          ),
          // ********************************** Form ******************************
          Container(
              child: Form(
            child: Column(
              children: [
                rowForm(
                  height: height,
                  width: width,
                  label1: "First Name",
                  label2: "Last Name",
                  widthCol1: 0.4,
                  widthCol2: 0.4,
                ),
                SizedBox(
                  height: height * 0.00,
                ),
                rowForm(
                  height: height,
                  width: width,
                  label1: "Adress",
                  label2: "Phone",
                  widthCol1: 0.5,
                  widthCol2: 0.3,
                ),
                SizedBox(
                  height: height * 0.00,
                ),
                rowForm(
                  height: height,
                  width: width,
                  label1: "Postal code",
                  label2: "Email",
                  widthCol1: 0.3,
                  widthCol2: 0.5,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
