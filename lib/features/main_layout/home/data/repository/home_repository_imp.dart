import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/internet_checker.dart';
import 'package:ecommerce_app/features/main_layout/home/data/data_source/home_remote_data_source.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entity/brand_entity/Brands_entity.dart';

import 'package:ecommerce_app/features/main_layout/home/domain/entity/categories_entity/Categories_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/home_repository.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImp implements HomeRepository {
  HomeRemoteDataSource apiDao;

  @factoryMethod
  HomeRepositoryImp(this.apiDao);

  @override
  Future<Either<CategoriesEntity, String>> getCategories() async {

    bool isConnected = await InternetChecker.checkNetwork();
    if (isConnected) {
    var result = await apiDao.getCategories();
      return result.fold(
        (categoryResponse) {
          return Left(categoryResponse.toCategoriesEntity());
          //we use function to change from response to entity
        },
        (error) {
          return Right(error.toString());
        },
      );
    } else {
      return Right("No Internet connection");
    }
  } 

  @override
  Future<Either<BrandsEntity, String>> getBrands() async {
    if (await InternetChecker.checkNetwork()) {
      var result = await apiDao.getBrands();
      return result.fold(
          (brandsResponse) => Left(
                brandsResponse.toBrandsEntity(),
              ),
          (error) => Right(error.toString()));
    }return Right("No Internet connection");
  }
}
