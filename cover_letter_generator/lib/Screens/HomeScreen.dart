import 'package:cover_letter_generator/Widgets/listLetters.dart';
import 'package:cover_letter_generator/utils/colors.dart';
import 'package:cover_letter_generator/utils/form_helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
        padding: EdgeInsets.all(10),
        child: FloatingActionButton(
            backgroundColor: primaryColor,
            shape: const CircleBorder(),
            onPressed: () {
              showModal(context);
            },
            child: const FaIcon(
              FontAwesomeIcons.wandMagicSparkles,
              color: Colors.white,
            )),
      ),
      body: Column(
        children: [
          Container(
            // color: Colors.lightBlue,
            margin: EdgeInsets.symmetric(
              horizontal: width * 0.08,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: const Column(
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
                ),
                const Spacer(),
                const Icon(
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
                    margin: EdgeInsets.only(top: 20),
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
                                child: listLetters())
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

  Future<dynamic> showModal(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return showModalBottomSheet(
      // enableDrag: true,
      // isScrollControlled: true,
      backgroundColor: primaryColor,
      context: context,
      builder: (context) =>
          //  LayoutBuilder(
          //   builder: (context, constraints) =>
          Column(
        children: [
          Container(
            // height: constraints.maxHeight * 0.2,
            child: Text("tet"),
          ),
          Form(
            child: Column(
              children: [
                TextFormField(),
                TextFormField(),
                TextFormField(),
                TextFormField(),
              ],
            ),
          )
        ],
        //
      ),

      // ),
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
            Text(
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
    var size = MediaQuery.of(context).size;
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
