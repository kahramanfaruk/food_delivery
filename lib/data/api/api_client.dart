import 'package:get/get.dart';
import 'package:my_app/utils/app_constants.dart';

class ApiClient extends GetConnect implements GetxService{
  late String token;
  final String appBaseUrl;

  // Map is for storing the data locally
  late Map<String, String> _mainHeaders; //key and value
  
  //Constructer for API Client
  ApiClient({ required this.appBaseUrl}){
    baseUrl=appBaseUrl;
    timeout=Duration(seconds: 30);
    token = AppConstants.TOKEN;
    _mainHeaders={
      'content-type':'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Response> getData(String uri,) async {
    try{
      Response response = await get(uri); //create a get request
      return response; //save the data in response type of object
    }catch(e){
      return Response(statusCode: 1, statusText: e.toString()); //if it fails, return the fail and error message
    }
  }
}