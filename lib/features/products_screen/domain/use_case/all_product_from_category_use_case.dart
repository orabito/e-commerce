
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/products_screen/domain/repository/products_screen_repository.dart';
import 'package:injectable/injectable.dart';

import '../entity/Products_entity.dart';
@injectable
class AllProductFromCategoryUseCase {
  ProductsScreenRepository repo;
  @factoryMethod
  AllProductFromCategoryUseCase(this.repo);
  Future<Either<ProductsEntity, String>> call(String id)=>repo.getProductFromCategory(id);
}