import 'package:flutter/material.dart';

class stepIconBuilder extends StatelessWidget {
  final Color color;
  final Icon icon;
  const stepIconBuilder(this.color, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: icon,
    );
  }
}
