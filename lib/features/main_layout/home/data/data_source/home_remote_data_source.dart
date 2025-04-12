import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/home/data/model/brands_response/Brands_response_model.dart';
import 'package:ecommerce_app/features/main_layout/home/data/model/categories_response/Categories_response.dart';

abstract class HomeRemoteDataSource {
 Future<Either<CategoriesResponse,String>> getCategories();
 Future<Either<BrandsResponseModel,String>> getBrands();
}

