import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/remote/Api_manger.dart';
import 'package:ecommerce_app/core/remote/end_points.dart';

import 'package:ecommerce_app/features/products_screen/data/model/Product_response_model.dart';
import 'package:injectable/injectable.dart';

import '../products_screen_remote_data_source.dart';
@Injectable(as: ProductsScreenRemoteDataSource)
class ProductsScreenRemoteDataSourceImp implements ProductsScreenRemoteDataSource  {
  @factoryMethod
  ProductsScreenRemoteDataSourceImp(this.apiManger);

  ApiManger apiManger;
  @override
  Future<Either<ProductResponseModel, String>> getProductsFromCategories(String id) async {
 try {
   var response =await apiManger .getRequest(path: EndPoints.allProducts,parameters: {"category[in]": id});
   return Left(ProductResponseModel.fromJson(response.data));
 } on Exception catch (error) {
   return Right(error.toString());
 }
 
 
 
 
  }
}