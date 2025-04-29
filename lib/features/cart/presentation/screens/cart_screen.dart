import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/cart/presentation/logic/get_cart_cubit.dart';
import 'package:ecommerce_app/features/products_screen/data/model/ProductModel.dart';
import 'package:ecommerce_app/features/products_screen/presentation/logic/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../widgets/cart_item_widget.dart';
import '../widgets/total_price_and_checkout_botton.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<GetCartCubit>()..getUserCart(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Cart',
            style:
                getMediumStyle(fontSize: 20.sp, color: ColorManager.textColor),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: ImageIcon(
                AssetImage(
                  IconsAssets.icSearch,
                ),
                color: ColorManager.primary,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: ImageIcon(
                AssetImage(IconsAssets.icCart),
                color: ColorManager.primary,
              ),
            ),
          ],
        ),
        body: BlocBuilder<GetCartCubit, GetCartState>(
          builder: (context, state) {
            if (state is GetCartSuccess) {

              final products = state.cart.data?.products ?? [];
              return Padding(
                padding: REdgeInsets.all(AppPadding.p14),
                child: Column(
                  children: [
                    Expanded(
                      // the list of cart items ===============
                      child: ListView.separated(
                        itemBuilder: (context, index) => CartItemWidget(
                          onDeleteTap: () {
                                GetCartCubit.get(context).removeCart(products[index].id??"");

                            // BlocBuilder<GetCartCubit, GetCartState>(
                            //
                            //   builder:(context, state) {
                            //     GetCartCubit.get(context).removeCart(products[index].id??"");
                            //
                            //   } ,
                            // )




                          },
                          onDecrementTap: (value) {},
                          onIncrementTap: (value) {},
                         cartModel: products[index], productEntity: products[index].product!.toProductEntity(),
                        ),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: AppSize.s12.h),
                        itemCount:products.length,
                      ),
                    ),
                    // the total price and checkout button========
                    TotalPriceAndCheckoutBotton(
                      totalPrice: state.cart.data?.totalCartPrice?.toInt() ?? 0,
                      checkoutButtonOnTap: () {},
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              );
            }
            if (state is GetCartError) {
              return Center(
                child: Text(state.error),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
