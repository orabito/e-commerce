import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/internet_checker.dart';
import 'package:ecommerce_app/features/cart/data/data_source/cart_remote_data_source.dart';

import 'package:injectable/injectable.dart';

import '../../../products_screen/data/model/add_cart/Add_cart_model.dart';
import '../../domain/repository/cart_repository.dart';

@Injectable(as: CartRepository)
class CartRepositoryImp implements CartRepository {
  CartRemoteDataSource cartDataSource;

  @factoryMethod
  CartRepositoryImp(this.cartDataSource);

  @override
  Future<Either<AddCartModel, String>> getCart() async {
    if (await InternetChecker.checkNetwork()) {
      var result = await cartDataSource.getCart();
     return result;


    } return Right('No Internet');
  }
}
