import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/local/prefs_helper.dart';
import 'package:ecommerce_app/core/remote/Api_manger.dart';
import 'package:ecommerce_app/core/remote/end_points.dart';
import 'package:ecommerce_app/features/cart/data/model/remove_cart/Remove_cart.dart';
import 'package:injectable/injectable.dart';
import '../../../../products_screen/data/model/add_cart/Add_cart_model.dart';
import '../cart_remote_data_source.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImp implements CartRemoteDataSource {
  ApiManger apiManger;

  @factoryMethod
  CartRemoteDataSourceImp(this.apiManger);

  @override
  Future<Either<AddCartModel, String>> getCart() async {
    try {
      var response = await apiManger.getRequest(
          path: EndPoints.addCart, headers: {"token": PrefsHelper.getToken()});

      return left(AddCartModel.fromJson(response.data));
    } on Exception catch (e) {
      return Right(e.toString());
    }
  }

  @override
  Future<Either<RemoveCart, String>> removeCart(String id ) async {
    try {
      var response = await apiManger.getRequest(
          path: "${EndPoints.addCart}/$id", headers: {"token": PrefsHelper.getToken()});

      return left(RemoveCart.fromJson(response.data));
    } on Exception catch (e) {
      return Right(e.toString());
    }
  }
  }

