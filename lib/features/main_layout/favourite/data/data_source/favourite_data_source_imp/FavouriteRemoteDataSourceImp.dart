import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/local/prefs_helper.dart';
import 'package:ecommerce_app/core/remote/Api_manger.dart';
import 'package:ecommerce_app/core/remote/end_points.dart';

import 'package:ecommerce_app/features/main_layout/favourite/data/model/Get_wishlist_response.dart';
import 'package:injectable/injectable.dart';

import '../favourite_remote_data_source.dart';

@Injectable(as: FavouriteRemoteDataSource)
class FavouriteRemoteDataSourceImp implements FavouriteRemoteDataSource {
  ApiManger apiManger;

  @factoryMethod
  FavouriteRemoteDataSourceImp(this.apiManger);

  @override
  Future<Either<GetWishlistResponse, String>> getFavourite() async {
    try {
      var response = await apiManger.getRequest(
          path: EndPoints.wishlist, headers: {"token": PrefsHelper.getToken()});
      return Left(GetWishlistResponse.fromJson(response.data));
    } on Exception catch (error) {
      return Right(error.toString());
    }
  }
}
