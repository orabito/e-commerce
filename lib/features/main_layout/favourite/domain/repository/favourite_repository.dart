import 'package:dartz/dartz.dart';

import '../../../../products_screen/data/model/ProductModel.dart';
import '../../data/model/Get_wishlist_response.dart';


abstract class FavouriteRepository {
  Future<Either<List<ProductModel>, String>> getFavourite();

}