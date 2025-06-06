import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/local/prefs_helper.dart';
import 'package:ecommerce_app/core/remote/Api_manger.dart';
import 'package:ecommerce_app/core/remote/end_points.dart';

import 'package:ecommerce_app/features/products_screen/data/model/Product_response_model.dart';
import 'package:ecommerce_app/features/products_screen/data/model/add__wishlist_model/Add__wishlist_model.dart';
import 'package:ecommerce_app/features/products_screen/data/model/add_cart/Add_cart_model.dart';
import 'package:injectable/injectable.dart';

import '../products_screen_remote_data_source.dart';

@Injectable(as: ProductsScreenRemoteDataSource)
class ProductsScreenRemoteDataSourceImp
    implements ProductsScreenRemoteDataSource {
  @factoryMethod
  ProductsScreenRemoteDataSourceImp(this.apiManger);

  ApiManger apiManger;

  @override
  Future<Either<ProductResponseModel, String>> getProductsFromCategories(
      String? id) async {
    try {
      var response = await apiManger.getRequest(
          path: EndPoints.allProducts,
          parameters: id != null ? {"category[in]": id} : null);
      return Left(ProductResponseModel.fromJson(response.data));
    } on Exception catch (error) {
      return Right(error.toString());
    }
  }

  @override
  Future<Either<AddWishlistModel, String>> addToWishList(
      String productId) async {
    // TODO: implement addToWishList
    try {
      var response = await apiManger.postRequestRow(
          path: EndPoints.wishlist,
          body: {"productId": productId},
          headers: {"token": PrefsHelper.getToken()});

      return Left(AddWishlistModel.fromJson(response.data));
    } on Exception catch (error) {
      return Right(error.toString());
    }
  }

  @override
  Future<Either<AddCartModel, String>> addToCart(String productId) async {
    try {
      var response =
          await apiManger.postRequestRow(path: EndPoints.addCart, headers: {
        "token": PrefsHelper.getToken(),
      }, body: {
        "productId": productId,
      });

      return Left(AddCartModel.fromJson(response.data));
    } on Exception catch (error) {
      return Right(error.toString());
    }
  }
}
