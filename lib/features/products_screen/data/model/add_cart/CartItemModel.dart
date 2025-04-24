import 'package:ecommerce_app/features/products_screen/data/model/ProductModel.dart';

/// count : 2
/// _id : "6808e290fcb4490dd2c01ed1"
/// product : "6428eb43dc1175abc65ca0b3"
/// price : 149

class CartItemModel {
  CartItemModel({
    this.count,
    this.id,
    this.product,
    this.price,
  });

  CartItemModel.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
//  i use her productmodel but maybe become string or productmodel
//    so i check it
    if (json['product'] is String) {
      product = ProductModel(id: json['product']);
    } else {
      product = ProductModel.fromJson(json['product']);
    }
    price = json['price'];
  }

  num? count;
  String? id;
  ProductModel? product;
  num? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['_id'] = id;
    map['product'] = product;
    map['price'] = price;
    return map;
  }
}
