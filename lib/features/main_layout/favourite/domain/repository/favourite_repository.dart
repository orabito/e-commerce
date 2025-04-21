import 'package:dartz/dartz.dart';

import '../../../../products_screen/domain/entity/ProductEntity.dart';

abstract class FavouriteRepository {
  Future<Either<List<ProductEntity>, String>> getFavourite();
}
