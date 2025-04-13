import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/internet_checker.dart';
import 'package:ecommerce_app/features/products_screen/data/data_source/products_screen_remote_data_source.dart';

import 'package:ecommerce_app/features/products_screen/domain/entity/Products_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/products_screen_repository.dart';

@Injectable(as: ProductsScreenRepository)
class ProductsScreenRepositoryImp implements ProductsScreenRepository {
  ProductsScreenRemoteDataSource dataSource;

  @factoryMethod
  ProductsScreenRepositoryImp(this.dataSource);

  @override
  Future<Either<ProductsEntity, String>> getProductFromCategory(
      String id) async {
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
}
