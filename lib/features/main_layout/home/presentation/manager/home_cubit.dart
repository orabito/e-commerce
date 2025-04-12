import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entity/brand_entity/Brands_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entity/categories_entity/Categories_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/use_case/get_brands_use_case.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/use_case/get_categories_use_case.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';
@injectable
class HomeCubit extends Cubit<HomeState> {
  @factoryMethod
  HomeCubit(this.getCategoriesUseCase,this.brandsUseCase) : super(HomeInitial());
  GetCategoriesUseCase getCategoriesUseCase;
  GetBrandsUseCase brandsUseCase;
  Future<void> getCategories() async {
    emit(HomeCategoriesLoadingState());
  var result  = await getCategoriesUseCase.call();
  result.fold((categoriesEntity) {
    emit(HomeCategoriesSuccessState(categoriesEntity));
  }, (error) {
emit(HomeCategoriesErrorState(error.toString()));
  },);
  }
  Future<void> getBrands() async {
emit(HomeBrandsLoadingState());
 var result=await   brandsUseCase.call();
 result.fold((brandsEntity) {
   emit(HomeBrandsSuccessState(brandsEntity));
 }, (error) {
   emit(HomeBrandsErrorState(
     error
   ));

 },);

  }

}
