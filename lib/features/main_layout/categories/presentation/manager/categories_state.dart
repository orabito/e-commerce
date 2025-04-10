part of 'categories_cubit.dart';


sealed class CategoriesState {}

 class CategoriesInitial extends CategoriesState {}
 class CategoriesSuccessState  extends CategoriesState {
   CategoriesEntity categoriesEntity;
   CategoriesSuccessState(this.categoriesEntity);
 }
 class CategoriesLoadingState extends CategoriesState {


}
final class CategoriesErrorState extends CategoriesState {
  String error;
  CategoriesErrorState(this.error);
}
