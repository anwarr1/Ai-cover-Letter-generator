import 'package:cover_letter_generator/Screens/HomeScreen.dart';
import 'package:cover_letter_generator/utils/colors.dart';
import 'package:cover_letter_generator/utils/form_helper.dart';
import 'package:flutter/material.dart';

class PersonalInfoForm extends StatelessWidget {
  double height, width;
  PersonalInfoForm(this.width, this.height);

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
              "Personal Information",
              style: TextStyle(
                color: primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          // ********************************** Form ******************************
          Container(
              child: Form(
            child: Column(
              children: [
                rowForm(
                  width: width,
                  firstColumn: InputUI(
                      width: width * 0.4,
                      hint: FormHelper.isInputRequired("First Name")),
                  SecondColumn: InputUI(
                      width: width * 0.4,
                      hint: FormHelper.isInputRequired("Last Name")),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                rowForm(
                  width: width,
                  firstColumn: InputUI(
                    width: width * 0.5,
                    hint: FormHelper.isInputRequired("Address"),
                  ),
                  SecondColumn: InputUI(
                    width: width * 0.3,
                    hint: FormHelper.isInputRequired("Phone"),
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                rowForm(
                  width: width,
                  firstColumn: InputUI(
                    width: width * 0.3,
                    hint: FormHelper.isInputRequired("ZIP code"),
                  ),
                  SecondColumn: InputUI(
                    width: width * 0.5,
                    hint: FormHelper.isInputRequired("Email"),
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
