import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/products_screen/domain/entity/Products_entity.dart';
import 'package:ecommerce_app/features/products_screen/domain/entity/add_wishlist_entity/Add_wishlist_entity.dart';


abstract class ProductsScreenRepository {

  Future<Either<ProductsEntity,String>>  getProductFromCategory(String? id);
  Future<Either<AddWishlistEntity,String>> addToWishList(String productId);

}