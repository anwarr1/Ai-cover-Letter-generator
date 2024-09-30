import 'package:cover_letter_generator/Provider/PersonalInfoProvider.dart';
import 'package:cover_letter_generator/utils/colors.dart';
import 'package:cover_letter_generator/utils/Ui/form_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PersonalInfoForm extends ConsumerWidget {
  double height, width;
  PersonalInfoForm(this.width, this.height, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personData = ref.watch(personalInforDataProvider);
    final personNotifier = ref.watch(personalInforDataProvider.notifier);
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
                    hint: FormHelper.isInputRequired("First Name"),
                    onChanged: (value) {
                      personNotifier.setPersonInfo(
                          value,
                          personData.lastName,
                          personData.phone,
                          personData.address,
                          personData.email,
                          personData.zip);
                    },
                  ),
                  SecondColumn: InputUI(
                    width: width * 0.4,
                    hint: FormHelper.isInputRequired("Last Name"),
                    onChanged: (value) {
                      personNotifier.setPersonInfo(
                          personData.firstName,
                          value,
                          personData.phone,
                          personData.address,
                          personData.email,
                          personData.zip);
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                rowForm(
                  width: width,
                  firstColumn: InputUI(
                    width: width * 0.5,
                    hint: FormHelper.isInputRequired("Address"),
                    onChanged: (value) {
                      personNotifier.setPersonInfo(
                          personData.firstName,
                          personData.lastName,
                          personData.phone,
                          value,
                          personData.email,
                          personData.zip);
                    },
                  ),
                  SecondColumn: InputUI(
                    width: width * 0.3,
                    hint: FormHelper.isInputRequired("Phone"),
                    onChanged: (value) {
                      personNotifier.setPersonInfo(
                          personData.firstName,
                          personData.lastName,
                          value,
                          personData.address,
                          personData.email,
                          personData.zip);
                    },
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
                    onChanged: (value) {
                      personNotifier.setPersonInfo(
                          personData.firstName,
                          personData.lastName,
                          personData.phone,
                          personData.address,
                          personData.email,
                          value);
                    },
                  ),
                  SecondColumn: InputUI(
                    width: width * 0.5,
                    hint: FormHelper.isInputRequired("Email"),
                    onChanged: (value) {
                      personNotifier.setPersonInfo(
                          personData.firstName,
                          personData.lastName,
                          personData.phone,
                          personData.address,
                          value,
                          personData.zip);
                    },
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
