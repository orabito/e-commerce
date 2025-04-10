import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entity/categories_entity/Categories_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetCategoriesUseCase {
  HomeRepository repo;
  GetCategoriesUseCase(this.repo);
 Future<Either<CategoriesEntity, String>> call()=>repo.getCategories();
}