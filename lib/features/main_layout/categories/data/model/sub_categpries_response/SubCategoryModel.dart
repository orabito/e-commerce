import 'package:ecommerce_app/features/main_layout/categories/domain/entity/sub_categories_entity/sub_category_entity.dart';

/// _id : "6407f276b575d3b90bf957b8"
/// name : "Bags & luggage"
/// slug : "bags-and-luggage"
/// category : "6439d5b90049ad0b52b90048"
/// createdAt : "2023-03-08T02:27:02.780Z"
/// updatedAt : "2023-04-14T23:10:29.386Z"

class SubcategoryModel {
  SubcategoryModel({
      this.id,
      this.name, 
      this.slug, 
      this.category, 
      this.createdAt, 
      this.updatedAt,});

  SubcategoryModel.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  String? id;
  String? name;
  String? slug;
  String? category;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['category'] = category;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }
SubCategoryEntity toSubCategoryEntity(){
    return SubCategoryEntity(
      name: name,
      id: id
    );
}
}