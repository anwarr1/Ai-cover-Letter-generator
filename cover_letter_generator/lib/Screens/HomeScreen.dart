
import 'package:cover_letter_generator/Widgets/listLetters.dart';
import 'package:cover_letter_generator/utils/colors.dart';
import 'package:cover_letter_generator/utils/custome_stepper.dart';
import 'package:cover_letter_generator/utils/form_helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        titleSpacing: 0,
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        backgroundColor: primaryColor,
        title: const Text(
          'coverAi',
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10),
        child: FloatingActionButton(
            backgroundColor: primaryColor,
            shape: const CircleBorder(),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: primaryColor,
                builder: (BuildContext context) {
                  return LayoutBuilder(
                      builder: (context, constraints) =>
                          ModalContent(constraints));
                },
              );
            },
            child: const FaIcon(
              FontAwesomeIcons.wandMagicSparkles,
              color: Colors.white,
            )),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: width * 0.08,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Welcome ',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: width * 0.08),
                        child: const Text(
                          'Anwar Aammar! ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ]),
                Spacer(),
                Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 40,
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Expanded(
            child: Container(
                margin: const EdgeInsets.only(top: 20),
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  color: Colors.white,
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                                top: constraints.maxHeight * 0.10),
                            child: listLetters()),
                      ],
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}

class rowFormm extends StatelessWidget {
  const rowFormm({
    super.key,
    required this.height,
    required this.width,
    required this.label1,
    required this.label2,
    required this.widthCol1,
    required this.widthCol2,
  });

  final double height;
  final double width;
  final double widthCol1;
  final double widthCol2;
  final Widget label1;
  final Widget label2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "",
              style:
                  TextStyle(fontSize: 11, color: Color.fromARGB(255, 0, 0, 0)),
            ),
            SizedBox(
              height: height * 0.005,
            ),
            SizedBox(
                width: width * widthCol1,
                child: FormHelper.textInput(context, (_) {}, label1,
                    isRequired: true)),
          ],
        ),
        SizedBox( 
          width: width * 0.02,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "",
              style:
                  TextStyle(fontSize: 11, color: Color.fromARGB(255, 0, 0, 0)),
            ),
            SizedBox(
              height: height * 0.005,
            ),
            SizedBox(
                width: width * widthCol2,
                child: FormHelper.textInput(context, (_) {}, label2)),
          ],
        ),
      ],
    );
  }
}

// *************************************************************** show Modal **************************************************************

class ModalContent extends StatefulWidget {
  BoxConstraints constraints;
  ModalContent(this.constraints);
  @override
  _ModalContentState createState() => _ModalContentState();
}

class _ModalContentState extends State<ModalContent> {
  final double _bottomPadding = 0;
  int selectedPage = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    var height = widget.constraints.maxHeight;
    var width = widget.constraints.maxWidth;
    return Container(
        color: primaryColor,
        height: height * 1,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: _bottomPadding + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
              color: Colors.white,
              // height: height,
              child: CustomStepperWidget(width, height)),

          //  Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: <Widget>[
          //     // ********************************** Stepper ******************************

          //     Container(
          //         color: Colors.white, child: CustomStepperWidget(width, height)),
          //   ],
          // ),
          // ),
        ));
  }
}


