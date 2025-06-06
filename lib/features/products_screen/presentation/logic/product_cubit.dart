import 'package:ecommerce_app/features/products_screen/domain/entity/Products_entity.dart';
import 'package:ecommerce_app/features/products_screen/domain/entity/add_cart_entity/Add_cart_entity.dart';
import 'package:ecommerce_app/features/products_screen/domain/entity/add_wishlist_entity/Add_wishlist_entity.dart';
import 'package:ecommerce_app/features/products_screen/domain/use_case/add_to_cart_use_case.dart';
import 'package:ecommerce_app/features/products_screen/domain/use_case/all_product_from_category_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/use_case/add_to_wishlist_use_case.dart';

part 'product_state.dart';

@injectable
class ProductCubit extends Cubit<ProductState> {
  AllProductFromCategoryUseCase useCase;
  AddToWishlistUseCase addWishlistUseCase;
  AddToCartUseCase cartUseCase;

  // ProductsEntity?addproduct;
  @factoryMethod
  ProductCubit(this.cartUseCase, this.useCase, this.addWishlistUseCase)
      : super(ProductInitial());

  getProductFromCategory(id) async {
    emit(ProductLoadingState());
    var result = await useCase.call(id);
    result.fold(
      (productEntity) {
        // addproduct=productEntity;
        emit(ProductSuccessState(productEntity));
      },
      (error) {
        ProductErrorState(error);
      },
    );
  }

  addToWishlist(String id) async {
    emit(AddToWishlistLoadingState(id));

    var result = await addWishlistUseCase.call(id);
    result.fold(
      (addWishlistEntity) {
        emit(AddToWishlistSuccessState(addWishlistEntity, id));
      },
      (error) {
        emit(AddToWishlistErrorState(error, id));
      },
    );

    // print(result.fold((l) =>print(l.message ), (r) => print(r),));
  }

  addToCart(String productId) async {
    emit(AddToCartLoadingState(productId));
    var result = await cartUseCase.call(productId);
    result.fold(
      (addCartEntity) {
        emit(AddToCartSuccessState(productId, addCartEntity));
      },
      (error) {
        emit(AddToCartErrorState(error,productId));
      },
    );
  }

  static ProductCubit get(context) => BlocProvider.of(context);
}
