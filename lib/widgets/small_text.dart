import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  Color? color; //THe question mark makes it optional
  final String text;
  double size;
  double height;

  SmallText({
    Key? key,
    this.color = const Color(0xFFccc7c5), // Text Color
    required this.text,
    this.size = 12,
    this.height = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(fontFamily: 'Roboto', color: color, fontSize: size));
  }
}
