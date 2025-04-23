/// count : 2
/// _id : "6808e290fcb4490dd2c01ed1"
/// product : "6428eb43dc1175abc65ca0b3"
/// price : 149

class CartItemModel {
  CartItemModel({
      this.count,
      this.id, 
      this.product, 
      this.price,});

  CartItemModel.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }
  num? count;
  String? id;
  String? product;
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