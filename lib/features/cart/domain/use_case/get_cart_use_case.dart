import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../products_screen/data/model/add_cart/CartModel.dart';

@injectable
class GetCartUseCase {
  CartRepository repo;

  @factoryMethod
  GetCartUseCase(this.repo);

  Future<Either<CartModel, String>> call() => repo.getCart();
}
