import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/cart/domain/repository/cart_repository.dart';
import 'package:ecommerce_app/features/products_screen/data/model/add_cart/Add_cart_model.dart';
import 'package:injectable/injectable.dart';


@injectable
class GetCartUseCase {
  CartRepository repo;

  @factoryMethod
  GetCartUseCase(this.repo);

  Future<Either<AddCartModel, String>> call() => repo.getCart();
}
