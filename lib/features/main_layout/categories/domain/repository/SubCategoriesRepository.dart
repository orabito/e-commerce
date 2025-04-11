import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/entity/sub_categories_entity/Sub_categories_entity.dart';

abstract class SubCategoriesRepository {
  Future<Either<SubCategoriesEntity,String>>getSubCategories(String id);

}