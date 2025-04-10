part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class HomeCategoriesSuccess extends HomeState {
CategoriesEntity categoriesEntity;

HomeCategoriesSuccess(this.categoriesEntity);
}
final class HomeCategoriesLoadingState extends HomeState {}
final class HomeCategoriesErrorState extends HomeState {
  String errorMassage;
  HomeCategoriesErrorState(this.errorMassage);
}


