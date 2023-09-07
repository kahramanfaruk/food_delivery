import 'package:flutter/material.dart';
import 'package:my_app/utils/dimensions.dart';
import 'package:my_app/widgets/app_column.dart';
import 'package:my_app/widgets/app_icon.dart';
import 'package:my_app/widgets/big_text.dart';
import 'package:my_app/widgets/expandable_text_widget.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("lib/assets/image/sushi.jpg")
                )
              ),
          )),
          
          //icon widgets
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIcon(icon: Icons.arrow_back_ios),
              AppIcon(icon: Icons.shopping_cart_checkout_outlined)
              ],
            )),
          
          //introduction of food
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize-20,
            child: Container(

              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20)
                ),
                color: Colors.white
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: "Turkish Side"), 
                  SizedBox(height: Dimensions.height20,),
                  BigText(text: "Introduce"),
                  SizedBox(height: Dimensions.height20,),

                  //expandable text widget
                  Expanded(child: SingleChildScrollView(child: ExpandableTextWidget(text: "Sushi is one of the most popular Japanese dishes out there, and for good reason! It’s healthy, delicious, and can be made to suit any budget. If you’re thinking about trying sushi for the first time or are simply looking to brush up on your sushi knowledge, then this article is for you. Well cover all the basics, from common ingredients to various types of sushi rolls. So lets get started!"))) //Expanded is needed for scrolling
                ],
              )
          ))

        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height30, left: Dimensions.width20, right: Dimensions.width20), //Just to put everything in the middle
        decoration: BoxDecoration(
          color: Color(0xFFF5F5F5), //Grey color at the end
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20*2),
            topRight: Radius.circular(Dimensions.radius20*2)
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white
              ),
              child: Row(
                children: [
                  Icon(Icons.remove, color: Colors.blue,),
                  SizedBox(width: Dimensions.width10/2,),
                  BigText(text: "0"),
                  SizedBox(width: Dimensions.width10/2,),
                  Icon(Icons.add, color: Colors.blue,)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height30, left: Dimensions.width20, right: Dimensions.width20), //Just to put everything in the middle
              
              child: BigText(text: "\$10 | Add to cart", color: Colors.white,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.tealAccent
  
              ),
            )
          ],
        ),
       ),
    );
  }
}