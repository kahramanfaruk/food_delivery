import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/data/repository/popular_product_repo.dart';
import 'package:my_app/models/products_model.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProdductRepo;
  PopularProductController({required this.popularProdductRepo});
  List<ProductModel> _popularProductList=[];
  List<ProductModel> get popularProductList => _popularProductList;

  Future<void> getPopularProductList()async {
    Response response = await popularProdductRepo.getPopularProductList(); // Future olursa await koymak zorunlu
    if(response.statusCode==200){
      print("got products");
      _popularProductList=[];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      update();
    }else{

    }
  }
}