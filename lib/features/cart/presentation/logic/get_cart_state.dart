part of 'get_cart_cubit.dart';

@immutable
sealed class GetCartState {}

final class GetCartInitial extends GetCartState {}

final class GetCartSuccess extends GetCartState {
  GetCartSuccess(this.cart);
 final AddCartModel cart;
}
final class GetCartLoading extends GetCartState {

}
final class GetCartError extends GetCartState {
  final String error;
  GetCartError(this.error);
}

final class RemoveCartSuccess extends GetCartState {
  RemoveCartSuccess(this.cart,this.id);
  final RemoveCart cart;
  final String id;
}

final class RemoveCartLoading extends GetCartState {
  final String id;
  RemoveCartLoading(this.id);
}
final class RemoveCartError extends GetCartState {
  final String error;
  final  String id;

  RemoveCartError(this.error,this.id);
}

