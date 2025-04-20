import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/products_screen/domain/entity/Products_entity.dart';

import '../../../../products_screen/data/model/ProductModel.dart';
import '../../../../products_screen/domain/entity/ProductEntity.dart';


abstract class FavouriteRepository {
  Future<Either<List<ProductEntity>, String>> getFavourite();

}