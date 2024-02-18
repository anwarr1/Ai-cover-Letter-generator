import 'dart:ffi';

import 'package:cover_letter_generator/Widgets/listLetters.dart';
import 'package:cover_letter_generator/utils/colors.dart';
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
      floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
          shape: const CircleBorder(),
          onPressed: () {},
          child: const FaIcon(
            FontAwesomeIcons.wandMagicSparkles,
            color: Colors.white,
          )),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: height * 0.25,
              ),
              Expanded(
                child: Container(
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
                                    top: constraints.maxHeight * 0.15),
                                child: listLetters())
                          ],
                        );
                      },
                    )
                    // child: listLetters(),
                    ),
              ),
            ],
          ),
          Positioned(
              top: height * 0.2, // Adjust the positioning as needed
              right: width * 0.05,
              child: circularLetter())
        ],
      ),
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
        Icon(
          Icons.person,
          color: Colors.white,
          size: 25,
        ),
        VerticalDivider(color: Colors.red, indent: 5),
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
