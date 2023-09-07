import 'package:my_app/controllers/popular_product_controller.dart';
import 'package:my_app/data/repository/popular_product_repo.dart';

class Product {
  //private fields
  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List<ProductModel> _products;
  List<ProductModel> get products=>_products; //public field

  //initialize the constructer
  Product({required totalSize, required typeId, required offset, required products}){
    this._totalSize=totalSize;
    this._typeId=typeId;
    this._offset=offset;
    this._products=products;
  }


  Product.fromJson(Map<String, dynamic> json) {
      _totalSize = json['total_size'];
      _typeId = json['type_id'];
      _offset = json['offset'];
      if (json['products'] != null) {
        _products = <ProductModel>[];
        json['products'].forEach((v) { //loop through with the forEach function
          _products!.add(ProductModel.fromJson(v)); // Add to the list. Json file is: http://mvs.bslmeiyu.com/api/v1/products/popular
      });
    }
  }
}

class ProductModel {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? location;
  String? createdAt;
  String? updatedAt;
  int? typeId;

  ProductModel(
    {this.id,
      this.name,
      this.description,
      this.price,
      this.stars,
      this.img,
      this.location,
      this.createdAt,
      this.updatedAt,
      this.typeId});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stars = json['stars'];
    img = json['img'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    typeId = json['type_id'];
  }
}