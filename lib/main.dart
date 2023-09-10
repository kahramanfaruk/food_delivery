//Tutorial: 7:14:25
import 'package:flutter/material.dart';
import 'package:my_app/controllers/popular_product_controller.dart';
import 'package:my_app/pages/food/popular_food_detail.dart';
import 'package:get/get.dart';
import 'package:my_app/pages/food/recommended_food_detail.dart';
import 'helper/dependencies.dart' as dep;
import 'package:my_app/pages/home/food_page_body.dart';
import 'package:my_app/pages/home/main_food_page.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized(); //Make sure that your dependenceies are loaded correctly and wait until they are loaded
  await dep.init(); //Load the dependencies before running the application
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      Get.find<PopularProductController>().getPopularProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainFoodPage(),
    );
  }
}
