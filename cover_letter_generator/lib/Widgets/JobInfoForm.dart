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
           SizedBox(
                  height: height * 0.05,
                ),
          Container(
              child: Form(
            child: Column(
              children: [
                rowForm(
                  width: width,
                  firstColumn: InputUI(
                    width: width * 0.45,
                    hint: FormHelper.isInputRequired("Job title"),
                  ),
                  SecondColumn: InputUI(
                      width: width * 0.35,
                      hint: FormHelper.isInputRequired("Years of experience")),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                rowForm(
                  width: width,
                  firstColumn: InputUI(
                    width: width * 0.4,
                    hint: FormHelper.isInputRequired("Education"),
                  ),
                  SecondColumn: InputUI(
                      width: width * 0.4,
                      hint: FormHelper.isInputRequired("Postal code ")),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                rowForm(
                  width: width,
                  firstColumn: InputUI(
                    width: width * 0.6,
                    hint: FormHelper.isInputRequired("Skills Keywords...",
                        isRequired: false),
                  ),
                  SecondColumn: Text(''),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
