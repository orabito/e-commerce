import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/use_case/get_categories_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../home/domain/entity/categories_entity/Categories_entity.dart';

part 'categories_state.dart';
@injectable
class CategoriesCubit extends Cubit<CategoriesState> {
  @factoryMethod
  CategoriesCubit(this.getCategoriesUseCase) : super(CategoriesInitial());


  static CategoriesCubit get(context) => BlocProvider.of(context);
  GetCategoriesUseCase getCategoriesUseCase;
getCategories()async{
  emit(CategoriesLoadingState());
 var result =await getCategoriesUseCase.call();
 result.fold((response) {
   emit(CategoriesSuccessState(response));

 }, (error) {
emit(CategoriesErrorState(error));
 });

}

}
