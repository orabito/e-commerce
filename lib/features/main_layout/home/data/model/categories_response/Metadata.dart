import 'package:ecommerce_app/features/main_layout/home/domain/entity/categories_entity/Metadata_entity.dart';

/// currentPage : 1
/// numberOfPages : 1
/// limit : 40
/// nextPage : 3
/// prevPage : 1

class Metadata {
  Metadata({
      this.currentPage, 
      this.numberOfPages, 
      this.limit, 
      this.nextPage, 
      this.prevPage,});

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
    nextPage = json['nextPage'];
    prevPage = json['prevPage'];
  }
  num? currentPage;
  num? numberOfPages;
  num? limit;
  num? nextPage;
  num? prevPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['numberOfPages'] = numberOfPages;
    map['limit'] = limit;
    map['nextPage'] = nextPage;
    map['prevPage'] = prevPage;
    return map;
  }
  MetadataEntity  toMetadataEntity(){
    return MetadataEntity(
      currentPage: currentPage,
      limit: limit,
      nextPage: nextPage,
      numberOfPages: numberOfPages,
      prevPage: prevPage
    );
}
}