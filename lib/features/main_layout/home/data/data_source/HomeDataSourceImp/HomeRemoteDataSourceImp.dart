import 'package:dartz/dartz.dart';

import 'package:ecommerce_app/features/main_layout/home/data/model/categories_response/Categories_response.dart';

import '../home_remote_data_source.dart';

class HomeRemoteDataSourceImp implements HomeRemoteDataSource  {
  @override
  Future<Either<CategoriesResponse, String>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

}