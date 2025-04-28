import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/cart/data/model/remove_cart/Remove_cart.dart';
import 'package:ecommerce_app/features/products_screen/data/model/add_cart/Add_cart_model.dart';

abstract class CartRemoteDataSource {
  Future<Either<AddCartModel,String>> getCart();
  Future<Either<RemoveCart,String>> removeCart(String id);
}

