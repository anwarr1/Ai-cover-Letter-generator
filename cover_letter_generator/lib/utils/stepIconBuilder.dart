import 'package:flutter/material.dart';

class stepIconBuilder extends StatelessWidget {
  Color color;
  Icon icon;
  stepIconBuilder(this.color, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 24,
      // height: 24,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: icon,
    );
  }
}
