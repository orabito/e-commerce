import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/local/prefs_helper.dart';
import 'package:ecommerce_app/core/remote/Api_manger.dart';
import 'package:ecommerce_app/core/remote/end_points.dart';
import 'package:ecommerce_app/features/products_screen/data/model/add_cart/CartModel.dart';
import 'package:injectable/injectable.dart';
import '../cart_remote_data_source.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImp implements CartRemoteDataSource {
  ApiManger apiManger;

  @factoryMethod
  CartRemoteDataSourceImp(this.apiManger);

  @override
  Future<Either<CartModel, String>> getCart() async {
    try {
      var response = await apiManger.getRequest(
          path: EndPoints.addCart, headers: {"token": PrefsHelper.prefs});

      return left(CartModel.fromJson(response.data));
    } on Exception catch (e) {
      return Right(e.toString());
    }
  }
}
