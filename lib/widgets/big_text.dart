import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_app/utils/dimensions.dart';


class BigText extends StatelessWidget {
  final Color? color; //The question mark makes it optional
  final String text;
  final double size;
  final TextOverflow overFlow;

  //final double size;
  //final TextOverflow overflow; // Corrected the typo in the property name


  BigText({Key? key, this.color = const Color(0xFF332D2B),
    required this.text,
    this.size=0,
    this.overFlow = TextOverflow.ellipsis
  }): super(key: key);       // Three dots called ellipses if there is a text overflow

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size==0?Dimensions.font20:size,
        fontWeight: FontWeight.w400
      ),
    );
  }
}
