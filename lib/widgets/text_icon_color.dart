import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextIconColor extends StatelessWidget {
  final IconData icon;
  final Color textColor;
  final Color iconColor;
  final String text;
  double size;
  TextOverflow overflow;
  TextIconColor({required this.icon, this.overflow= TextOverflow.ellipsis, required this.iconColor, required this.text, this.textColor=Colors.black38, this.size=12});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor,),
        Text(text, style: TextStyle(color: textColor), )
      ],
    );
  }
}