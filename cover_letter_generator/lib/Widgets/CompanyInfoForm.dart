import 'package:cover_letter_generator/Provider/CompanyInfoProvider.dart';
import 'package:cover_letter_generator/Screens/HomeScreen.dart';
import 'package:cover_letter_generator/utils/colors.dart';
import 'package:cover_letter_generator/utils/form_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CompanyInfoForm extends ConsumerWidget {
  double height, width;
  CompanyInfoForm(this.width, this.height);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var companyData = ref.watch(companyInforDataProvider);
    var companyNotifier = ref.watch(companyInforDataProvider.notifier);
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
                rowForm(
                  width: width,
                  firstColumn: InputUI(
                    width: width * 0.4,
                    hint: FormHelper.isInputRequired("Company Name"),
                    onChanged: (value) {
                      companyNotifier.setCompanyInfo(
                        name: value,
                        address: companyData.address,
                        department: companyData.department,
                      );
                    },
                  ),
                  SecondColumn: InputUI(
                    width: width * 0.4,
                    hint: FormHelper.isInputRequired("Company Address"),
                    onChanged: (value) {
                      companyNotifier.setCompanyInfo(
                        name: companyData.name,
                        address: value,
                        department: companyData.department,
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                rowForm(
                  width: width,
                  firstColumn: InputUI(
                    width: width * 0.45,
                    hint: FormHelper.isInputRequired("Department"),
                    onChanged: (value) {
                      companyNotifier.setCompanyInfo(
                        name: companyData.name,
                        address: companyData.address,
                        department: value,
                      );
                    },
                  ),
                  SecondColumn: InputUI(
                    width: width * 0.35,
                    hint: FormHelper.isInputRequired("Company Address"),
                    onChanged: (value) {
                      companyNotifier.setCompanyInfo(
                        name: companyData.name,
                        address: companyData.address,
                        department: companyData.department,
                      );
                    },
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
