import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/remove_cart/Remove_cart.dart';
import '../repository/cart_repository.dart';
@injectable
class CartRemoveUseCase {
  CartRepository cartRepository;
  @factoryMethod
  CartRemoveUseCase(this.cartRepository);
  Future<Either<RemoveCart, String>> call(String id)=>cartRepository.removeCart(id);
}