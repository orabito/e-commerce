import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/main_layout/favourite/domain/use_case/get_wishlist_use_case.dart';
import 'package:ecommerce_app/features/products_screen/data/model/ProductModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../products_screen/domain/entity/ProductEntity.dart';

part 'favourite_state.dart';

@injectable
class FavouriteCubit extends Cubit<FavouriteState> {
  @factoryMethod
  FavouriteCubit(this.useCase) : super(FavouriteInitial());
  GetWishlistUseCase useCase;
static get(context) => BlocProvider.of<FavouriteCubit>(context);
  getFavourite() async {
    emit(FavouriteLoading());
    var result = await useCase.call();
    result.fold(
      (productList) {
        emit(FavouriteSuccessState(productList));
      },
      (error) {
        emit(FavouriteError(error));
      },
    );
  }
}
