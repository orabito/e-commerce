import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/model/Get_wishlist_response.dart';

abstract class FavouriteRemoteDataSource {
 Future<Either<GetWishlistResponse, String>> getFavourite();
}

