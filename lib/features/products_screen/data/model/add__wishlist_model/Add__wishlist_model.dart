import '../../../domain/entity/add_wishlist_entity/Add_wishlist_entity.dart';

/// status : "success"
/// statusMsg : "fail"
/// message : "Product added successfully to your wishlist"
/// data : ["6428ebc6dc1175abc65ca0b9"]

class AddWishlistModel {
  AddWishlistModel({
      this.status, 
      this.statusMsg, 
      this.message, 
      this.data,});

  AddWishlistModel.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }
  String? status;
  String? statusMsg;
  String? message;
  List<String>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['statusMsg'] = statusMsg;
    map['message'] = message;
    map['data'] = data;
    return map;
  }

  AddWishlistEntity toWishListEntity(){
    return AddWishlistEntity(
        message: message,
        status: status,
        statusMsg: statusMsg
    );

}}