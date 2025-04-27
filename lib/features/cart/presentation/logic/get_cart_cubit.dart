import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/cart/domain/use_case/get_cart_use_case.dart';
import 'package:ecommerce_app/features/products_screen/data/model/add_cart/CartModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'get_cart_state.dart';
@injectable
class GetCartCubit extends Cubit<GetCartState> {
  @factoryMethod
  GetCartCubit(this.cartUseCase) : super(GetCartInitial());
  static GetCartCubit get(context)=>BlocProvider.of(context);
  GetCartUseCase cartUseCase;
  getUserCart() async {
    emit(GetCartLoading());
    var response =await cartUseCase.call();
    response.fold((cartModel) {
      emit(GetCartSuccess(cartModel));
    }, (error) {
      emit(GetCartError(error));

    },);
  }
}
