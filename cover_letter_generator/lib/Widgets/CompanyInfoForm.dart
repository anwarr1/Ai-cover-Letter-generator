import 'package:cover_letter_generator/Screens/HomeScreen.dart';
import 'package:cover_letter_generator/utils/colors.dart';
import 'package:cover_letter_generator/utils/form_helper.dart';
import 'package:flutter/material.dart';

class CompanyInfoForm extends StatelessWidget {
  double height, width;
  CompanyInfoForm(this.width, this.height);

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
              "Company Information",
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
                  label1: FormHelper.isInputRequired("Company Name"),
                  label2: FormHelper.isInputRequired("Company Address"),
                  widthCol1: 0.4,
                  widthCol2: 0.4,
                ),

                rowForm(
                  height: height,
                  width: width,
                  label1:  FormHelper.isInputRequired("Department"),
                  label2:  FormHelper.isInputRequired("Date of letter"),
                  widthCol1: 0.45,
                  widthCol2: 0.35,
                ),
                SizedBox(
                  height: height * 0.00,
                ),
                // rowForm(
                //   height: height,
                //   width: width,
                //   label1: "Postal code",
                //   label2: "Email",
                //   widthCol1: 0.3,
                //   widthCol2: 0.5,
                // ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
