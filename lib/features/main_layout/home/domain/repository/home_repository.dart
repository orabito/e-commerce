import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entity/categories_entity/Categories_entity.dart';

abstract class HomeRepository {
  Future<Either<CategoriesEntity,String>>getCategories();
}