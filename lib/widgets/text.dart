// ignore_for_file: implementation_imports, unnecessary_import

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BigText extends StatelessWidget {
  double size;
  final Color? textColor;
  final String text;
  TextOverflow overFlow;
  dynamic? fontWeight;
  BigText(
      {required this.size,
      this.overFlow = TextOverflow.ellipsis,
      required this.text,
      this.textColor,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      style:
          TextStyle(color: textColor, fontSize: size, fontWeight: fontWeight, fontFamily: 'Poppons'),
    );
  }
}
