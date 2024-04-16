import 'package:cover_letter_generator/Screens/HomeScreen.dart';
import 'package:cover_letter_generator/utils/colors.dart';
import 'package:cover_letter_generator/utils/form_helper.dart';
import 'package:flutter/material.dart';

class JobInfoForm extends StatelessWidget {
  double height, width;
  JobInfoForm(this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: height * 0.01, bottom: height * 0.05),
      // color: Colors.red,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: const Text(
              "Job Information",
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
                  label1: FormHelper.isInputRequired("Job title"),
                  label2: FormHelper.isInputRequired("Years of experience",
                      isRequired: false),
                  widthCol1: 0.45,
                  widthCol2: 0.35,
                ),
                rowForm(
                  height: height,
                  width: width,
                  label1: FormHelper.isInputRequired("Education",
                      isRequired: false),
                  label2: FormHelper.isInputRequired("Personal Statement",
                      isRequired: false),
                  widthCol1: 0.35,
                  widthCol2: 0.45,
                ),
                SizedBox(
                  height: height * 0.00,
                ),
                rowForm(
                  height: height,
                  width: width,
                  label1: FormHelper.isInputRequired("Postal code"),
                  label2: FormHelper.isInputRequired("Skills Keywords...",
                      isRequired: false),
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
