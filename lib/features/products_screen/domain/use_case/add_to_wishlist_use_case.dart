import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/products_screen/domain/repository/products_screen_repository.dart';
import 'package:injectable/injectable.dart';

import '../entity/add_wishlist_entity/Add_wishlist_entity.dart';
@injectable
class AddToWishlistUseCase {
  ProductsScreenRepository repo;
  @factoryMethod
  AddToWishlistUseCase(this.repo);
  Future<Either<AddWishlistEntity, String>> call(String productId)=>repo.addToWishList(productId);
}