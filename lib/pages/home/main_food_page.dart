import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_app/pages/home/food_page_body.dart';
import 'package:my_app/utils/dimensions.dart';
import 'package:my_app/widgets/big_text.dart';
import 'package:my_app/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    print("Current height is "+MediaQuery.of(context).size.height.toString()); // Height of the UI
    return Scaffold(
      body: Column(
        children: [
          //showing the header
          Container(
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "FK", size: 30),
                      Row(
                        children: [
                          SmallText(text: "FABE", color: Colors.black54,),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.height45,
                      height: Dimensions.height45,
                      child: Icon(Icons.search, color: Colors.white, size: Dimensions.iconSize24,), // Search icon is added here
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius15),
                        color: Colors
                            .blue, // Color can be changed here for the icon
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //showing the body
          Expanded(child: SingleChildScrollView(
            child: FoodPageBody(),
          )),
        ],
      ),
    );
  }
}
