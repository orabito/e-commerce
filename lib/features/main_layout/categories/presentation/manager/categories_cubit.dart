import 'package:ecommerce_app/features/main_layout/categories/domain/use_case/get_sub_categories_use_case.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entity/categories_entity/category_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/use_case/get_categories_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../home/domain/entity/categories_entity/Categories_entity.dart';
import '../../domain/entity/sub_categories_entity/Sub_categories_entity.dart';

part 'categories_state.dart';

@injectable
class CategoriesCubit extends Cubit<CategoriesState> {
  @factoryMethod
  CategoriesCubit(this.getCategoriesUseCase, this.subCategoriesUseCase)
      : super(CategoriesInitial());

  static CategoriesCubit get(context) => BlocProvider.of(context);
  GetCategoriesUseCase getCategoriesUseCase;
  GetSubCategoriesUseCase subCategoriesUseCase;

  CategoryEntity? selectedCategory;

  getCategories() async {
    emit(CategoriesLoadingState());
    var result = await getCategoriesUseCase.call();
    result.fold((response) {
      selectedCategory = response.data![0];
      getSubCategories();
      emit(CategoriesSuccessState(response));
    }, (error) {
      emit(CategoriesErrorState(error));
    });
  }

  changeSelectedCategory(CategoryEntity newCategoryEntity) {
    selectedCategory = newCategoryEntity;
    getSubCategories();
    emit(CategoriesNewState());
  }

  getSubCategories() async {
    emit(SubCategoriesLoadingState());
    var result =
        await subCategoriesUseCase.call(selectedCategory?.id.toString() ?? "");
    result.fold(
      (response) => emit(SubCategoriesSuccessState(response)),
      (error) => emit(CategoriesErrorState(error)),
    );
  }
}
