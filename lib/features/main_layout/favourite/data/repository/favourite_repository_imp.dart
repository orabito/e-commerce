import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/internet_checker.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/data_source/favourite_remote_data_source.dart';

import 'package:injectable/injectable.dart';

import '../../../../products_screen/domain/entity/ProductEntity.dart';
import '../../domain/repository/favourite_repository.dart';

@Injectable(as: FavouriteRepository)
class FavouriteRepositoryImp implements FavouriteRepository {
  @factoryMethod
  FavouriteRepositoryImp(this.dataSource);

  FavouriteRemoteDataSource dataSource;

  @override
  Future<Either<List<ProductEntity>, String>> getFavourite() async {
    if (await InternetChecker.checkNetwork()) {
      var result = await dataSource.getFavourite();
      return result.fold(
        (response) {
          return Left(response.productModel!
              .map(
                (e) => e.toProductEntity(),
              )
              .toList());
        },
        (error) {
          return Right(error);
        },
      );
    } else {
      return Right("no internet connection ");
    }
  }
}
