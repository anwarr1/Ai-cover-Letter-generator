import 'package:cover_letter_generator/Provider/JobInfoProvider.dart';
import 'package:cover_letter_generator/Screens/HomeScreen.dart';
import 'package:cover_letter_generator/utils/colors.dart';
import 'package:cover_letter_generator/utils/form_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JobInfoForm extends ConsumerWidget {
  double height, width;
  JobInfoForm(this.width, this.height);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var jobData = ref.watch(jobInforDataProvider);
    var jobNotifier = ref.watch(jobInforDataProvider.notifier);
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
                    onChanged: (value) {
                      jobNotifier.setJobInfo(
                        title: value,
                        education: jobData.education,
                        postalCode: jobData.postalCode,
                        yearsOfExperience: jobData.yearsOfExperience,
                        skills: jobData.skills,
                      );
                    },
                  ),
                  SecondColumn: InputUI(
                    width: width * 0.35,
                    hint: FormHelper.isInputRequired("Years of experience"),
                    onChanged: (value) {
                      jobNotifier.setJobInfo(
                        title: jobData.title,
                        education: jobData.education,
                        postalCode: jobData.postalCode,
                        yearsOfExperience: value,
                        skills: jobData.skills,
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
                    width: width * 0.4,
                    hint: FormHelper.isInputRequired("Education"),
                    onChanged: (value) {
                      jobNotifier.setJobInfo(
                        title: jobData.title,
                        education: value,
                        postalCode: jobData.postalCode,
                        yearsOfExperience: jobData.yearsOfExperience,
                        skills: jobData.skills,
                      );
                    },
                  ),
                  SecondColumn: InputUI(
                    width: width * 0.4,
                    hint: FormHelper.isInputRequired("Postal code "),
                    onChanged: (value) {
                      jobNotifier.setJobInfo(
                        title: jobData.title,
                        education: jobData.education,
                        postalCode: value,
                        yearsOfExperience: jobData.yearsOfExperience,
                        skills: jobData.skills,
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
                    width: width * 0.6,
                    hint: FormHelper.isInputRequired("Skills Keywords...",
                        isRequired: false),   
                     onChanged: (value) {
                      jobNotifier.setJobInfo(
                         title:  jobData.title,
                          education:jobData.education,
                          postalCode:jobData.postalCode,
                          yearsOfExperience:jobData.yearsOfExperience,
                          skills:value,
                          );
                    },
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
