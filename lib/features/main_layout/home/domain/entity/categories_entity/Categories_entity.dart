import 'Metadata_entity.dart';
import 'category_entity.dart';

/// results : 10
/// metadata : {"currentPage":2,"numberOfPages":5,"limit":2,"nextPage":3,"prevPage":1}
/// data : [{"_id":"6439d41c67d9aa4ca97064d5","name":"SuperMarket","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511452254.png"}]

class CategoriesEntity {
  CategoriesEntity({
      this.results, 
      this.metadata, 
      this.data,});

  num? results;
  MetadataEntity? metadata;
  List<CategoryEntity>? data;


}