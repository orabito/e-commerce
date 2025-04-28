import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/cart/data/model/remove_cart/Remove_cart.dart';
import 'package:ecommerce_app/features/cart/domain/use_case/cart_remove_use_case.dart';
import 'package:ecommerce_app/features/cart/domain/use_case/get_cart_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../products_screen/data/model/add_cart/Add_cart_model.dart';

part 'get_cart_state.dart';

@injectable
class GetCartCubit extends Cubit<GetCartState> {
  @factoryMethod
  GetCartCubit(this.cartUseCase, this.removeUseCase) : super(GetCartInitial());

  static GetCartCubit get(context) => BlocProvider.of(context);
  GetCartUseCase cartUseCase;
  CartRemoveUseCase removeUseCase;

  getUserCart() async {
    emit(GetCartLoading());
    var response = await cartUseCase.call();
    response.fold((cartModel) {
      emit(GetCartSuccess(cartModel));
    }, (error) {
      emit(GetCartError(error));
    },);
  }

  removeCart(String id) async {
    emit(RemoveCartLoading());
    var response = await removeUseCase.call(id);
    response.fold((cart) {
      emit(RemoveCartSuccess(cart));
    }, (error) {
      emit(RemoveCartError(error));
    },);
  }
}
