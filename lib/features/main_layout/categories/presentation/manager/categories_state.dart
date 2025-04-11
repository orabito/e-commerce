part of 'categories_cubit.dart';


sealed class CategoriesState {}

 class CategoriesInitial extends CategoriesState {}
 class CategoriesSuccessState  extends CategoriesState {
   CategoriesEntity categoriesEntity;
   CategoriesSuccessState(this.categoriesEntity);
 }
 class CategoriesLoadingState extends CategoriesState {


}
 class CategoriesErrorState extends CategoriesState {
  String error;
  CategoriesErrorState(this.error);
}
 class CategoriesNewState extends CategoriesState {


}
class SubCategoriesSuccessState  extends CategoriesState {
  SubCategoriesEntity subCategoriesEntity;
  SubCategoriesSuccessState(this.subCategoriesEntity);
}
class SubCategoriesLoadingState extends CategoriesState {}
class SubCategoriesErrorState extends CategoriesState {
  String error;
  SubCategoriesErrorState(this.error);

}