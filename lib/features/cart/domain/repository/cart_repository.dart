import 'package:dartz/dartz.dart';

import '../../../products_screen/data/model/add_cart/Add_cart_model.dart';

abstract class CartRepository {
  Future<Either<AddCartModel,String>> getCart();

}