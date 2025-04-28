import 'package:dartz/dartz.dart';

import '../../../products_screen/data/model/add_cart/Add_cart_model.dart';
import '../../data/model/remove_cart/Remove_cart.dart';

abstract class CartRepository {
  Future<Either<AddCartModel,String>> getCart();

  Future<Either<RemoveCart,String>> removeCart(String id);


}