import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/model/sub_categpries_response/Sub_categpries_response.dart';

abstract class SubCategoriesRemoteDataSource {

 Future<Either<SubCategoriesResponse,String>>getSubCategories(String id);

}

