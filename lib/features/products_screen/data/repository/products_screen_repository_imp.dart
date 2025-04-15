import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/internet_checker.dart';
import 'package:ecommerce_app/features/products_screen/data/data_source/products_screen_remote_data_source.dart';
import 'package:ecommerce_app/features/products_screen/data/model/add__wishlist_model/Add__wishlist_model.dart';

import 'package:ecommerce_app/features/products_screen/domain/entity/Products_entity.dart';
import 'package:ecommerce_app/features/products_screen/domain/entity/add_wishlist_entity/Add_wishlist_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/products_screen_repository.dart';

@Injectable(as: ProductsScreenRepository)
class ProductsScreenRepositoryImp implements ProductsScreenRepository {
  ProductsScreenRemoteDataSource dataSource;

  @factoryMethod
  ProductsScreenRepositoryImp(this.dataSource);

  @override
  Future<Either<ProductsEntity, String>> getProductFromCategory(
      String? id) async {
    // TODO: implement getProductFromCategory
  if (await InternetChecker.checkNetwork()){
    var response = await dataSource.getProductsFromCategories(id);
    return response.fold(
          (productModel) => Left(productModel.toProductsEntity()),
          (error) =>Right( error),
    );
  }else{
    return Right("no internet");
  }
  }

  @override
  Future<Either<AddWishlistEntity, String>> addToWishList(String productId) async {
if (await InternetChecker.checkNetwork()) {
  var result=await dataSource.addToWishList(productId);
  return  result.fold(
        (wishlistmodel) {
          return Left(wishlistmodel.toWishListEntity());
        },
        (error) => Right(error),
      );
}return Right("no internet connection " );
  }
}
