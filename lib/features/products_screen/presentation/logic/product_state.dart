part of 'product_cubit.dart';


sealed class ProductState {}

final class ProductInitial extends ProductState {}
final class ProductSuccessState extends ProductState {
  ProductsEntity entity;
  ProductSuccessState(this.entity);
}
final class ProductErrorState extends ProductState {
  String error;
  ProductErrorState(this.error);
}
final class ProductLoadingState extends ProductState {}
