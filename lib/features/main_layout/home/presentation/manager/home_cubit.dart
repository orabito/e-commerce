import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entity/categories_entity/Categories_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/use_case/get_categories_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';
@injectable
class HomeCubit extends Cubit<HomeState> {
  @factoryMethod
  HomeCubit(this.getCategoriesUseCase) : super(HomeInitial());
  GetCategoriesUseCase getCategoriesUseCase;
  Future<void> getCategories() async {
    emit(HomeCategoriesLoadingState());
  var result  = await getCategoriesUseCase.call();
  result.fold((categoriesEntity) {
    emit(HomeCategoriesSuccess(categoriesEntity));
  }, (error) {
emit(HomeCategoriesErrorState(error.toString()));
  },);
  }

}
