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
final class AddToWishlistLoadingState extends ProductState {
  String productId;
  AddToWishlistLoadingState(this.productId);

}
final class AddToWishlistSuccessState extends ProductState {
AddWishlistEntity addWishlistEntity;
String productId;
AddToWishlistSuccessState(this.addWishlistEntity,this.productId);
}
final class AddToWishlistErrorState extends ProductState {
String error;
String productId;
AddToWishlistErrorState(this.error,this .productId);
}


