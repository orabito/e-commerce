import 'package:dartz/dartz.dart';

import '../../../products_screen/data/model/add_cart/CartModel.dart';

abstract class CartRepository {
  Future<Either<CartModel,String>> getCart();

}