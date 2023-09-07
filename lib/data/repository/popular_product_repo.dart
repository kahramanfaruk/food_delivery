import 'package:get/get.dart';
import 'package:my_app/data/api/api_client.dart';
import 'package:my_app/utils/app_constants.dart';


class PopularProductRepo extends GetxService{
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async{
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI); //postman - endpoint
  }
}