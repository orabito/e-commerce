import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/favourite/domain/repository/favourite_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../products_screen/domain/entity/ProductEntity.dart';

@injectable
class GetWishlistUseCase {
  @factoryMethod
  FavouriteRepository repository;
  GetWishlistUseCase(this.repository);
  Future<Either<List<ProductEntity>, String>> call() =>
      repository.getFavourite();
}
