part of 'get_cart_cubit.dart';

@immutable
sealed class GetCartState {}

final class GetCartInitial extends GetCartState {}
final class GetCartSuccess extends GetCartState {
  GetCartSuccess(this.cart);
 final CartModel cart;
}
final class GetCartLoading extends GetCartState {

}
final class GetCartError extends GetCartState {
  final String error;
  GetCartError(this.error);
}
