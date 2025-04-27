import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/products_screen/data/model/add_cart/CartModel.dart';

abstract class CartRemoteDataSource {
  Future<Either<CartModel,String>> getCart();
}

