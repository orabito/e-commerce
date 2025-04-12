import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/remote/Api_manger.dart';
import 'package:ecommerce_app/features/main_layout/home/data/model/brands_response/Brands_response_model.dart';

import 'package:ecommerce_app/features/main_layout/home/data/model/categories_response/Categories_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/remote/end_points.dart';
import '../home_remote_data_source.dart';
@Injectable(as:HomeRemoteDataSource )
class HomeRemoteDataSourceImp implements HomeRemoteDataSource  {
  ApiManger apiManger;
  @factoryMethod
  HomeRemoteDataSourceImp(this.apiManger);
  Future<Either<CategoriesResponse, String>> getCategories() async {
    
    try {
      var result =await apiManger.getRequest(path: EndPoints.categories, );
      
      return left(CategoriesResponse.fromJson(result.data));
      
    } on Exception catch (error) {
      // TODO
      return Right(error.toString());
    }

    }

  @override
  Future<Either<BrandsResponseModel, String>> getBrands() async {
try {
  var response =await apiManger.getRequest(path: EndPoints.allBrands);
  return Left(BrandsResponseModel.fromJson(response.data));
} on Exception catch (error) {
  return Right(error.toString());
}
  }
  }

