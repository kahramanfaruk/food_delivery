import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/controllers/popular_product_controller.dart';
import 'package:my_app/models/products_model.dart';
import 'package:my_app/utils/dimensions.dart';
import 'package:my_app/widgets/app_column.dart';
import 'package:my_app/widgets/big_text.dart';
import 'package:my_app/widgets/icon_and_text_widget.dart';
import 'package:my_app/widgets/small_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:my_app/utils/app_constants.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85); 
  var _currPageValue=0.0;
  double _scaleFactor=0.8;
  double _height=Dimensions.pageViewContainer;

  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue=pageController.page!; //Get the value of the page
        // print("Current Value is"+_currPageValue.toString());
      });
    });
  }

  // Remove the page from memory
  @override
  void dispose(){
    pageController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider section - // Create an instance of the get builder
        GetBuilder<PopularProductController>(builder:(popularProducts){
          return Container(
          //color: Colors.redAccent, // Background color
            height: Dimensions.pageView,
            child: PageView.builder(
                controller: pageController,
                itemCount: popularProducts.popularProductList.length,
                itemBuilder: (context, position) {
                  return _buildPageItem(position, popularProducts.popularProductList[position]);//send object from the list
                }),
          );
        }),

        //dots
        GetBuilder<PopularProductController>(builder: (popularProducts){
          return  DotsIndicator(
            //dotsCount: popularProducts.popularProductList.isNotEmpty ? popularProducts.popularProductList.length: 2,
            //dotsCount: 5,
            dotsCount: popularProducts.popularProductList.isEmpty?1:popularProducts.popularProductList.length, //Issue: It is not updating to 6
            position: _currPageValue,
            decorator: DotsDecorator(
              activeColor: Color(0xFF80CBC4),
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),

        //popular text
        SizedBox(height: Dimensions.height30,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"), 
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: ".", color:Colors.black26),
              ),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Food pairing",),
              )
            ],
          ),
        ),

        //list of food and images
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true, //AlwaysScrollable..() oldugu zaman comment out yap
            itemCount:10, 
            itemBuilder: (context, index){
            return Container(
              margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height10),
              child: Row(
                children: [
                  //Image section
                  Container(
                    width: Dimensions.listViewImgSize,
                    height: Dimensions.listViewImgSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white38,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                          image: AssetImage("lib/assets/image/sushi.jpg")
                      )
                    )
                  ),
                 
                  //text container
                  Expanded(
                    child: Container(
                      height: Dimensions.listViewTextContSize,
                      //width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.radius20),
                          bottomRight: Radius.circular(Dimensions.radius20)
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center, //vertical
                          children: [
                            //BigText(text: "Nutritious fruit meal in Japan"),

                            BigText(text: "Nutritious fruit meal in Japan"),//Changed


                            SizedBox(height: Dimensions.height10,),
                            SmallText(text: "With japanese characteristics"),
                            SizedBox(height: Dimensions.height10,),

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
                        ),
                      ),
                    )
                  )
                ],
              ),
            );
          }),
      ],
    );
  }


  // Zoom In and Zoom Out. And also scaling when we move it to left and right
  Widget _buildPageItem(int index, ProductModel popularProduct) { //Catch object from the list
    Matrix4 matrix = new Matrix4.identity();
    if (index==_currPageValue.floor()){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }else if(index==_currPageValue.floor()+1){
      var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1);
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }else if(index==_currPageValue.floor()-1){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      matrix=Matrix4.diagonal3Values(1, currScale, 1);
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currScale, 0);

    }else{
      var currScale=0.8;
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);

    }


    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10), // Creates empty space between slides
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: Colors.black,
                //color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      AppConstants.BASE_URL+"/uploads/"+popularProduct.img! // GEt the images from the server
                      //"lib/assets/image/food1.png"
                      )
                )
            )
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container( // Thhe small widget in the main interface. It has a column with two rows below.
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30, bottom: Dimensions.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  //Shadow property
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0, //If it is 1, it is very very blurry
                      offset: Offset(0, 5)
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0)
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0)
                    )
                  ]//It takes list of childeren
                  //color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
              ),
              child: AppColumn(text: popularProduct.name!), // Name of the products at the top of the menu that we get from the server
            ),
          )
        ],
      ),
    );
  }
}
