import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/remote/Api_manger.dart';
import 'package:ecommerce_app/core/remote/end_points.dart';

import 'package:ecommerce_app/features/main_layout/categories/data/model/sub_categpries_response/Sub_categpries_response.dart';
import 'package:injectable/injectable.dart';

import '../categories_remote_data_source.dart';

@Injectable(as: SubCategoriesRemoteDataSource)
class SubCategoriesRemoteDataSourceImp extends SubCategoriesRemoteDataSource {
  ApiManger apiManger;

  @factoryMethod
  SubCategoriesRemoteDataSourceImp(this.apiManger);

  @override
  Future<Either<SubCategoriesResponse, String>> getSubCategories(
      String id) async {
    try {
      var response = await apiManger.getRequest(
        path: EndPoints.subcategoriesEndpoint(id),
      );
      return Left(SubCategoriesResponse.fromJson(response.data));
    } on Exception catch (error) {
      return Right(error.toString());
    }
  }
}
