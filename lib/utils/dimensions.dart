import 'package:get/get.dart';

class Dimensions{
  static double screenHeight= Get.context!.height;
  static double screenWidth= Get.context!.width;


  // 720/220 -> 720 is the height of the screen on linux based laptop. 220 is the height of the main widget.
  // a=720/320=2,25
  // x=720/220=3,27
  // y=720/120=6
  static double pageView=screenHeight/2.25;
  static double pageViewContainer=screenHeight/3.27;
  static double pageViewTextContainer=screenHeight/6;


  // Dynamic Height padding and margin: 720/10=72
  static double height10=screenHeight/72;
  static double height15=screenHeight/54;
  static double height20=screenHeight/36;
  static double height30=screenHeight/27;
  static double height45=screenHeight/16;



  // Dynamic Height padding and margin: 720/10=72
  static double width10=screenHeight/72;
  static double width15=screenHeight/54;
  static double width20=screenHeight/36;
  static double width30=screenHeight/27;

  //font size
  static double font16=screenHeight/45;
  static double font20=screenHeight/36;
  static double font26=screenHeight/32.46;


  //Radius
  static double radius15=screenHeight/54;
  static double radius20=screenHeight/36;
  static double radius30=screenHeight/27;

  //icon size
  static double iconSize24=screenHeight/30;
  static double iconSize16=screenHeight/52.75;


  //list view size
  static double listViewImgSize=screenWidth/3.25;
  static double listViewTextContSize=screenWidth/3.9;

  //popular food 
  static double popularFoodImgSize=screenHeight/2.41;

  //bottom height
  static double bottomHeightBar = screenHeight/6;


}