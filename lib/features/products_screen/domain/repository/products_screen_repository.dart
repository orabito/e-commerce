import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/products_screen/domain/entity/Products_entity.dart';

abstract class ProductsScreenRepository {

  Future<Either<ProductsEntity,String>>  getProductFromCategory(String id);
}