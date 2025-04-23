import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/products_screen/domain/repository/products_screen_repository.dart';
import 'package:injectable/injectable.dart';

import '../entity/add_cart_entity/Add_cart_entity.dart';

@injectable
class AddToCartUseCase {
  ProductsScreenRepository repo;

  @factoryMethod
  AddToCartUseCase(this.repo);

  Future<Either<AddCartEntity, String>> call(String productId) =>
      repo.addToCart(productId);
}
