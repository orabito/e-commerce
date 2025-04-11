import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/entity/sub_categories_entity/Sub_categories_entity.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/repository/SubCategoriesRepository.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetSubCategoriesUseCase {
  @factoryMethod
  SubCategoriesRepository repo;
  GetSubCategoriesUseCase(this.repo);
  Future<Either<SubCategoriesEntity,String>>call(String id)=>repo.getSubCategories(id);
}