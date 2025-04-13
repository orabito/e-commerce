
import '../../../main_layout/categories/domain/entity/sub_categories_entity/sub_category_entity.dart';
import '../../../main_layout/home/domain/entity/brand_entity/Brand_entity.dart';
import '../../../main_layout/home/domain/entity/categories_entity/category_entity.dart';

/// sold : 14441
/// images : ["https://ecommerce.routemisr.com/Route-Academy-products/1680403397482-1.jpeg","https://ecommerce.routemisr.com/Route-Academy-products/1680403397482-2.jpeg","https://ecommerce.routemisr.com/Route-Academy-products/1680403397483-3.jpeg","https://ecommerce.routemisr.com/Route-Academy-products/1680403397485-4.jpeg"]
/// ratingsQuantity : 18
/// _id : "6428ebc6dc1175abc65ca0b9"
/// title : "Woman Shawl"
/// description : "Material\tPolyester Blend\nColour Name\tMulticolour\nDepartment\tWomen"
/// quantity : 225
/// price : 191
/// imageCover : "https://ecommerce.routemisr.com/Route-Academy-products/1680403397402-cover.jpeg"
/// ratingsAverage : 4.8
/// id : "6428ebc6dc1175abc65ca0b9"

class ProductEntity {
  ProductEntity({
      this.sold, 
      this.images, 
      this.ratingsQuantity, 
      this.id, 
      this.title, 
      this.description, 
      this.quantity, 
      this.price, 
      this.imageCover, 
      this.ratingsAverage,
    this.subcategory,
    this.brand,
    this.category
      });

  num? sold;
  List<String>? images;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  num? ratingsAverage;
  BrandEntity ?brand;
  CategoryEntity? category;
 List<SubCategoryEntity> ? subcategory;




}