import 'package:ecommerce_app/features/products_screen/domain/entity/add_cart_entity/Add_cart_entity.dart';

import 'CartModel.dart';

/// status : "success"
/// message : "Product added successfully to your cart"
/// numOfCartItems : 1
/// cartId : "6808e290fcb4490dd2c01ed0"
/// data : {"_id":"6808e290fcb4490dd2c01ed0","cartOwner":"67f4f03f7379fd935b0d4bad","products":[{"count":2,"_id":"6808e290fcb4490dd2c01ed1","product":"6428eb43dc1175abc65ca0b3","price":149}],"createdAt":"2025-04-23T12:52:32.197Z","updatedAt":"2025-04-23T12:52:39.918Z","__v":0,"totalCartPrice":298}

class AddCartModel {
  AddCartModel({
      this.status,
    this.statusMsg,
      this.message, 
      this.numOfCartItems, 
      this.cartId, 
      this.data,});

  AddCartModel.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? CartModel.fromJson(json['data']) : null;
  }
  String? status;
  String? statusMsg;

  String? message;
  num? numOfCartItems;
  String? cartId;
  CartModel? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['statusMsg'] = statusMsg;
    map['message'] = message;
    map['numOfCartItems'] = numOfCartItems;
    map['cartId'] = cartId;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

  AddCartEntity toCartEntity(){
    return AddCartEntity(
      statusMsg: statusMsg,status: status,message: message
    );
  }
}