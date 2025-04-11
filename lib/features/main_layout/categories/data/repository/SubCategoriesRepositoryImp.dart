
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/internet_checker.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/data_source/categories_remote_data_source.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/entity/sub_categories_entity/Sub_categories_entity.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/repository/SubCategoriesRepository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:  SubCategoriesRepository)
class SubCategoriesRepositoryImp implements SubCategoriesRepository  {
SubCategoriesRemoteDataSource dao;
@factoryMethod
  SubCategoriesRepositoryImp(this.dao);
  @override
  Future<Either<SubCategoriesEntity, String>> getSubCategories(String id) async {
if(await InternetChecker.checkNetwork()){
  var result= await dao.getSubCategories(id);
  return result.fold((response) {
    return Left(response.toSubCategoriesEntity());

  }, (error) {
    return Right(error);
  },);
}
return Right("no internet");
  }
}