import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/products_screen/data/model/Product_response_model.dart';
import 'package:ecommerce_app/features/products_screen/data/model/add__wishlist_model/Add__wishlist_model.dart';
import 'package:ecommerce_app/features/products_screen/data/model/add_cart/Add_cart_model.dart';

abstract class ProductsScreenRemoteDataSource {
Future<Either<ProductResponseModel,String>> getProductsFromCategories(String? id);
Future<Either<AddWishlistModel,String>> addToWishList(String productId);
Future<Either<AddCartModel,String>> addToCart(String productId);

}

