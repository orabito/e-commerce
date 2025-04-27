import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/internet_checker.dart';
import 'package:ecommerce_app/features/cart/data/data_source/cart_remote_data_source.dart';

import 'package:ecommerce_app/features/products_screen/data/model/add_cart/CartModel.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/cart_repository.dart';

@Injectable(as: CartRepository)
class CartRepositoryImp implements CartRepository {
  CartRemoteDataSource cartDataSource;

  @factoryMethod
  CartRepositoryImp(this.cartDataSource);

  @override
  Future<Either<CartModel, String>> getCart() async {
    if (await InternetChecker.checkNetwork()) {
      var result = await cartDataSource.getCart();
     return result;


    } return Right('No Internet');
  }
}
