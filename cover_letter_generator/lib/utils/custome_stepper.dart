import 'package:cover_letter_generator/Screens/GeneratedLetter.dart';
import 'package:cover_letter_generator/Widgets/CompanyInfoForm.dart';
import 'package:cover_letter_generator/Widgets/JobInfoForm.dart';
import 'package:cover_letter_generator/Widgets/PersonalInfoForm.dart';
import 'package:cover_letter_generator/utils/colors.dart';
import 'package:cover_letter_generator/utils/stepIconBuilder.dart';
import 'package:flutter/material.dart';

class CustomStepperWidget extends StatefulWidget {
  double height, width;
  CustomStepperWidget(this.width, this.height);
  @override
  _CustomStepperWidgetState createState() => _CustomStepperWidgetState();
}

class _CustomStepperWidgetState extends State<CustomStepperWidget> {
  int _currentStep = 0;

  StepState _getStepState(int index) {
    if (index < _currentStep) {
      return StepState.complete; // completed step state
    } else if (index == _currentStep) {
      return StepState.editing; // current step state
    } else {
      return StepState.disabled; // disabled step state
    }
  }

  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        canvasColor: primaryColor,
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: Color.fromARGB(255, 169, 161, 194),
            ),
      ),
      child: Container(
        height: widget.height * 1,
        child: Column(
          children: [
            Expanded(
              child: Stepper(
                elevation: 0,
                controlsBuilder: (context, _) {
                  return Container(
                    margin: EdgeInsets.only(top: widget.height * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: cancel,
                          style: ElevatedButton.styleFrom(
                            // backgroundColor: Color.fromARGB(255, 249, 249, 249),
                            backgroundColor: secondColor,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: const Text(
                            'Back',
                            style: TextStyle(color: primaryColor),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => onStepContinue(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Text(
                            _currentStep < 2 ? 'Next' : "Complete !",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                type: StepperType.horizontal,
                physics: const ScrollPhysics(),
                currentStep: _currentStep,
                stepIconBuilder: (index, stepState) {
                  if (index < _currentStep) {
                    return stepIconBuilder(
                        Colors.green,
                        const Icon(Icons.check,
                            color: Colors.white)); // completed step icon
                  } else if (index == _currentStep) {
                    return stepIconBuilder(
                        secondColor,
                        const Icon(Icons.edit_outlined,
                            size: 20,
                            color: Colors.white)); // current step icon
                  } else {
                    return stepIconBuilder(
                        Color.fromARGB(255, 175, 175, 175),
                        const Icon(Icons.help_outline,
                            color: Colors.white)); // disabled step icon
                  }
                },
                onStepTapped: (step) => tapped(step),
                steps: steps,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Step> get steps {
    var size = MediaQuery.of(context).size;
    return <Step>[
      Step(
        state: _getStepState(0),
        title: Container(
          width: size.width * 0.11,
          child: const Text(
            'Step 1',
            // 'Personal Information',
            style: TextStyle(
              color: Color.fromARGB(255, 213, 213, 213),
            ),
          ),
        ),
        content: PersonalInfoForm(widget.width, widget.height),
        isActive: _currentStep >= 0,
      ),
      Step(
        state: _getStepState(1),
        title: SizedBox(
          width: size.width * 0.11,
          child: const Text(
            'Step 2',
            // 'Personal Information',
            style: TextStyle(
              color: Color.fromARGB(255, 213, 213, 213),
            ),
          ),
        ),
        content: CompanyInfoForm(widget.width, widget.height),
        isActive: _currentStep >= 0,
      ),
      Step(
        state: _getStepState(2),
        title: SizedBox(
          width: size.width * 0.11,
          child: const Text(
            'Step 3',
            // 'Personal Information',
            style: TextStyle(
              color: Color.fromARGB(255, 213, 213, 213),
            ),
          ),
        ),
        content: JobInfoForm(widget.width, widget.height),
        isActive: _currentStep >= 0,
      ),
    ];
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  onStepContinue() {
    // print("hahona printed");
    _currentStep < 2
        ? setState(() {
            _currentStep += 1;
          })
        : Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return GeneratedLetter();
            },
          ));
    //  MaterialPageRoute(
    //     builder: (context) {
    //       return GeneratedLetter();
    //     },
    //   );
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}
