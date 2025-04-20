part of 'favourite_cubit.dart';

sealed class FavouriteState {}

final class FavouriteInitial extends FavouriteState {}
final class FavouriteSuccessState extends FavouriteState {
  List<ProductEntity>productList;
  FavouriteSuccessState(this.productList);
}
final class FavouriteError extends FavouriteState {
  String error;
  FavouriteError(this.error);
}
final class FavouriteLoading extends FavouriteState {}
