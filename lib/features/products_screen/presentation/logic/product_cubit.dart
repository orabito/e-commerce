import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/products_screen/domain/entity/Products_entity.dart';
import 'package:ecommerce_app/features/products_screen/domain/use_case/all_product_from_category_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/use_case/add_to_wishlist_use_case.dart';

part 'product_state.dart';
@injectable
class ProductCubit extends Cubit<ProductState> {
  AllProductFromCategoryUseCase useCase;
  AddToWishlistUseCase  addWishlistUseCase;
  // ProductsEntity?addproduct;
  @factoryMethod
  ProductCubit(this.useCase,this.addWishlistUseCase) : super(ProductInitial());
  getProductFromCategory(id) async {
    emit(ProductLoadingState());
   var result=await   useCase.call(id);
   result.fold(
   (productEntity) {
     // addproduct=productEntity;
     emit(ProductSuccessState(productEntity));

   }
   , (error) {
     ProductErrorState(error);
   },);

  }
   addToWishlist(String id) async {
     var result=await addWishlistUseCase.call( id );
     print(result.length());

   }
  static ProductCubit get( context) =>BlocProvider.of(context) ;

}
