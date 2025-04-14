part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class HomeCategoriesSuccessState extends HomeState {
CategoriesEntity categoriesEntity;

HomeCategoriesSuccessState(this.categoriesEntity);
}
final class HomeCategoriesLoadingState extends HomeState {}
final class HomeCategoriesErrorState extends HomeState {
  String errorMassage;
  HomeCategoriesErrorState(this.errorMassage);
}
final class HomeBrandsSuccessState extends HomeState {
  BrandsEntity brandsEntity;

  HomeBrandsSuccessState(this.brandsEntity);
}
final class HomeBrandsLoadingState extends HomeState {}
final class HomeProductsLoadingState extends HomeState {}
final class HomeProductsSuccessState extends HomeState {
  ProductsEntity productsEntity;
  HomeProductsSuccessState(this.productsEntity);
}
final class HomeProductsErrorState extends HomeState {
  String error;
  HomeProductsErrorState(this.error);
}
final class HomeBrandsErrorState extends HomeState {
  String error;
  HomeBrandsErrorState(this.error);
}


