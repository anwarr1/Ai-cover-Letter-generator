import 'package:cover_letter_generator/Widgets/listLetters.dart';
import 'package:cover_letter_generator/utils/colors.dart';
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
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome ',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      Text(
                        'Anwar Aammar! ',
                        style: TextStyle(color: Colors.white, fontSize: 20),
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
            height: height * 0.03,
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
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
                Positioned(right: 0, top: 0, child: circularLetter()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class rowForm extends StatelessWidget {
  const rowForm({
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
  final String label1;
  final String label2;

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
                child: FormHelper.textInput(context, (_) {}, label1)),
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

class circularLetter extends StatelessWidget {
  const circularLetter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          shape: CircleBorder(),
          color: Colors.white,
          elevation: 5,
          child: Container(
            margin: EdgeInsets.all(6),
            width: 70,
            height: 70,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 255, 255, 255)),
            child: FaIcon(
              FontAwesomeIcons.fileSignature,
              color: primaryColor.withOpacity(0.8),
              size: 32,
            ),
          ),
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
  double _bottomPadding = 0;

  @override
  Widget build(BuildContext context) {
    var height = widget.constraints.maxHeight;
    var width = widget.constraints.maxWidth;
    return Container(
      color: primaryColor,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: _bottomPadding + MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // ********************************** Stepper ******************************

            Container(
              height: height * 0.2,
              child: Text("Custom Stepper"),
            ),
            Container(
              height: height * 0.75,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: PageView(controller: PageController(), children: [
                Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.all(15),
                      child: const Text(
                        "Personal Information",
                        style: TextStyle(
                          color: primaryColor,
                        ),
                      ),
                    ),
                    // ********************************** Form ******************************
                    Container(
                        color: Colors.white,
                        child: Form(
                          child: Column(
                            children: [
                              rowForm(
                                height: height,
                                width: width,
                                label1: "First Name",
                                label2: "Last Name",
                                widthCol1: 0.4,
                                widthCol2: 0.4,
                              ),
                              SizedBox(
                                height: height * 0.00,
                              ),
                              rowForm(
                                height: height,
                                width: width,
                                label1: "Adress",
                                label2: "Phone",
                                widthCol1: 0.5,
                                widthCol2: 0.3,
                              ),
                              SizedBox(
                                height: height * 0.00,
                              ),
                              rowForm(
                                height: height,
                                width: width,
                                label1: "Postal code",
                                label2: "Email",
                                widthCol1: 0.3,
                                widthCol2: 0.5,
                              ),
                              SizedBox(
                                height: height * 0.05,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return const HomeScreen();
                                      },
                                    ));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryColor,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 50,
                                        vertical: height * 0.018),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                  child: const Text(
                                    'Continue',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _updateBottomPadding();
    });
  }

  void _updateBottomPadding() {
    setState(() {
      _bottomPadding = MediaQuery.of(context).viewInsets.bottom;
    });
  }
}
