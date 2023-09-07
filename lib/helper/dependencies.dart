
//init method
import 'package:my_app/controllers/popular_product_controller.dart';
import 'package:my_app/data/api/api_client.dart';
import 'package:get/get.dart';
import 'package:my_app/data/repository/popular_product_repo.dart';
import 'package:my_app/utils/app_constants.dart';

Future<void> init()async{
  //Load the api client
  Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URL)); //Base link

  //Load repositories
  Get.lazyPut(()=>PopularProductRepo(apiClient: Get.find())); 

  //Controller
  Get.lazyPut(()=>PopularProductController(popularProdductRepo: Get.find())); 

}

