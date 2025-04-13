import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/products_screen/domain/entity/Products_entity.dart';
import 'package:ecommerce_app/features/products_screen/domain/use_case/all_product_from_category_use_case.dart';
import 'package:injectable/injectable.dart';

part 'product_state.dart';
@injectable
class ProductCubit extends Cubit<ProductState> {
  AllProductFromCategoryUseCase useCase;
  @factoryMethod
  ProductCubit(this.useCase) : super(ProductInitial());
  getProductFromCategory(id) async {
    emit(ProductLoadingState());
   var result=await   useCase.call(id);
   result.fold(
   (productEntity) {
     emit(ProductSuccessState(productEntity));

   }
   , (error) {
     ProductErrorState(error);
   },);

  }
}
