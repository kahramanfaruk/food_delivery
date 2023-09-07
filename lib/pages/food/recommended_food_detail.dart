import 'package:flutter/material.dart';
import 'package:my_app/widgets/app_icon.dart';
import 'package:my_app/widgets/big_text.dart';
import 'package:my_app/utils/dimensions.dart';
import 'package:my_app/widgets/expandable_text_widget.dart';


class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_checkout_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20), 
              child: Container(
                child: Center(child: BigText(size: Dimensions.font26, text: "Sliver app bar")),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20)
                  )
                ),
              ),
            ),
            pinned: true,
            backgroundColor: Colors.yellow,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "lib/assets/image/sushi.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover, //expandable height

              ), 
            ),
          ),
          SliverToBoxAdapter(
            //margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
            child: Column(
              children: [
                Container(
                  child: ExpandableTextWidget(text: "Sushi is one of the most popular Japanese dishes out there, and for good reason! It’s healthy, delicious, and can be made to suit any budget. If you’re thinking about trying sushi for the first time or are simply looking to brush up on your sushi knowledge, then this article is for you. Well cover all the basics, from common ingredients to various types of sushi rolls. So lets get started! Sushi is one of the most popular Japanese dishes out there, and for good reason! It’s healthy, delicious, and can be made to suit any budget. If you’re thinking about trying sushi for the first time or are simply looking to brush up on your sushi knowledge, then this article is for you. Well cover all the basics, from common ingredients to various types of sushi rolls. So lets get started! Sushi is one of the most popular Japanese dishes out there, and for good reason! It’s healthy, delicious, and can be made to suit any budget. If you’re thinking about trying sushi for the first time or are simply looking to brush up on your sushi knowledge, then this article is for you. Well cover all the basics, from common ingredients to various types of sushi rolls. So lets get started! e most popular Japanese dishes out there, and for good reason! It’s healthy, delicious, and can be made to suit any budget. If you’re thinking about trying sushi for the first time or are simply looking to brush up on your sushi knowledge, then this article is for you. Well cover all the basics, from common ingredients to various types of sushi rolls. So lets get started! Sushi is one of the most popular Japanese dishes out there, and for good reason! It’s healthy, delicious, and can be made to suit any budget. If you’re thinking about trying sushi for the first time or are simply looking to brush up on your sushi knowledge, then this article is for you. Well cover all the basics, from common ingredients to various types of sushi rolls. So lets get started! Sushi is one of the most popular Japanese dishes out there, and for good reason! It’s healthy, delicious, and can be made to suit any budget. If you’re thinking about trying sushi for the first time or are simply looking to brush up on your sushi knowledge, then this article is for you. Well cover all the basics, from common ingredients to various types of sushi rolls. So lets get started! ",
                  ),
                  margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),

                )
              ],
            )
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(left: Dimensions.width20*2.5,
                                     right: Dimensions.width20*2.5,
                                     top: Dimensions.height10,
                                     bottom: Dimensions.height10
                                     ),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIcon(
                      iconSize: Dimensions.iconSize24,
                      iconColor:Colors.white, 
                      backgroundColor: Colors.orange, 
                      icon: Icons.remove),
              BigText(text: "\$12.88 "+" X "+" 0 ", color: Colors.black, size: Dimensions.font26,),
              AppIcon(
                      iconSize: Dimensions.iconSize24,
                      iconColor:Colors.white, 
                      backgroundColor: Colors.orange, 
                      icon: Icons.add)
                      ],
                    )
                    ),

          Container(
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
              child: Icon(
                Icons.favorite,
                color: Colors.red,
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
      ]),
    );
  }
}


//import 'package:flutter/material.dart';

//class RecommenedFoodDetail extends StatelessWidget {
//  const RecommenedFoodDetail({Key? key}) : super(key: key);

//  @override
//  Widget build(BuildContext context) {
//    return Container();
//  }
//}