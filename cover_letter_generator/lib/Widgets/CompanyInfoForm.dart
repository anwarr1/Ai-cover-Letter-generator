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
          SizedBox(
            height: height * 0.05,
          ),
          Container(
              child: Form(
            child: Column(
              children: [
                // rowForm(
                //   height: height,
                //   width: width,
                //   label1:
                //   label2: ,
                //   widthCol1: 0.4,
                //   widthCol2: 0.4,
                // ),

                rowForm(
                  width: width,
                  firstColumn: InputUI(
                    width: width * 0.4,
                    hint: FormHelper.isInputRequired("Company Name"),
                  ),
                  SecondColumn: InputUI(
                      width: width * 0.4,
                      hint: FormHelper.isInputRequired("Company Address")),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                rowForm(
                  width: width,
                  firstColumn: InputUI(
                    width: width * 0.45,
                    hint: FormHelper.isInputRequired("Department"),
                  ),
                  SecondColumn: InputUI(
                      width: width * 0.35,
                      hint: FormHelper.isInputRequired("Company Address")),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
