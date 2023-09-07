import 'package:flutter/material.dart';
import 'package:my_app/utils/dimensions.dart';
import 'package:my_app/widgets/big_text.dart';
import 'package:my_app/widgets/icon_and_text_widget.dart';
import 'package:my_app/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;

  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: text, size: Dimensions.font26,),
                    SizedBox(height: Dimensions.height10,), // space in the small widget
                    Row(
                      children: [
                        //Wrap put thing horizontally
                        Wrap( 
                          children: List.generate(5, (index) => Icon(Icons.star, color: Color(0xFF80CBC4), size: 15,)), // Arrow means that it returns function
                        ),
                        SizedBox(width: 10,), // Create space
                        SmallText(text: "4.5"),
                        SizedBox(width: 10,),
                        SmallText(text: "1287"),
                        SizedBox(width: 10,),
                        SmallText(text: "comments")
                      ],
                    ),
                    SizedBox(height: Dimensions.height20,), // space in the small widget
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTextWidget(icon: Icons.circle_sharp, 
                          text: "Normal", 
                          iconColor: Color(0xFFFFB74D)),

                        IconAndTextWidget(icon: Icons.location_on, 
                          text: "1.7km", 
                          iconColor: Color(0xFF80CBC4)),

                        IconAndTextWidget(icon: Icons.access_time_rounded, 
                          text: "32min", 
                          iconColor: Color(0xFFEF9A9A))
                      ],
                    )
                  ],
                );
  }
}