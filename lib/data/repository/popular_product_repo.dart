import 'package:get/get.dart';
import 'package:my_app/data/api/api_client.dart';
import 'package:my_app/utils/app_constants.dart';
//import 'package:http/http.dart' as http;

class PopularProductRepo extends GetxService{
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async{
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI); //postman - endpoint
  }
}