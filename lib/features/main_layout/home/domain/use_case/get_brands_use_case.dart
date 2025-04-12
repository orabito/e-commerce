import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../entity/brand_entity/Brands_entity.dart';

@injectable
class GetBrandsUseCase {
  HomeRepository repo;
  @factoryMethod
  GetBrandsUseCase(this.repo);
  Future<Either<BrandsEntity, String>> call()=>repo.getBrands();

}