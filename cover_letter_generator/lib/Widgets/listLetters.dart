import 'package:auto_size_text/auto_size_text.dart';
import 'package:cover_letter_generator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class listLetters extends StatelessWidget {
  const listLetters({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.15),
          child: const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            "All",
                            maxLines: 1,
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                          AutoSizeText(
                            "(3)",
                            maxLines: 1,
                            style: TextStyle(
                                color: primaryColor,
                                // fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                  Icon(
                    Icons.tune_outlined,
                    color: primaryColor,
                    size: 30,
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        ListTile(
          leading: Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 205, 205, 205),
                shape: BoxShape.rectangle),
          ),
          title: Text("LP 2022"),
          subtitle: Text("2024-02-18 21:17"),
        )
      ],
    );
  }
}
