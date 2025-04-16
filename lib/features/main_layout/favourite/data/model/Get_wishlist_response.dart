
import 'package:ecommerce_app/features/products_screen/data/model/ProductModel.dart';

/// status : "success"
/// count : 1
/// data : [{"sold":14523,"images":["1680403397482-1.jpeg","1680403397482-2.jpeg","1680403397483-3.jpeg","1680403397485-4.jpeg"],"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"ratingsQuantity":18,"_id":"6428ebc6dc1175abc65ca0b9","title":"Woman Shawl","slug":"woman-shawl","description":"Material\tPolyester Blend\nColour Name\tMulticolour\nDepartment\tWomen","quantity":225,"price":191,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403397402-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"createdAt":"2023-04-02T02:43:18.400Z","updatedAt":"2025-04-16T15:39:06.666Z","__v":0,"id":"6428ebc6dc1175abc65ca0b9"}]

class GetWishlistResponse {
  GetWishlistResponse({
      this.status, 
      this.count, 
      this.productModel,});

  GetWishlistResponse.fromJson(dynamic json) {
    status = json['status'];
    count = json['count'];
    if (json['data'] != null) {
      productModel = [];
      json['data'].forEach((v) {
        productModel?.add(ProductModel.fromJson(v));
      });
    }
  }
  String? status;
  num? count;
  List<ProductModel>? productModel;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['count'] = count;
    if (productModel != null) {
      map['data'] = productModel?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}