import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/widget/product_counter.dart';
import 'package:ecommerce_app/features/cart/presentation/logic/get_cart_cubit.dart';
import 'package:ecommerce_app/features/products_screen/domain/entity/ProductEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../products_screen/data/model/add_cart/CartItemModel.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.onDeleteTap,
    required this.cartModel,
    required this.onIncrementTap,
    required this.onDecrementTap,
    required this.productEntity,
  });
  final void Function() onDeleteTap;
  final CartItemModel cartModel;
  final ProductEntity productEntity;
  final void Function(int value) onIncrementTap;
  final void Function(int value) onDecrementTap;

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        if (productEntity != null) {
          Navigator.pushNamed(context, Routes.productDetails,
              arguments: productEntity);
        } else {
          Fluttertoast.showToast(
            msg: "Product details not available",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
          );
        }
      },
      child: Container(
        height: isPortrait ? height * 0.14 : width * 0.23,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: ColorManager.primary.withOpacity(0.3)),
        ),
        child: Row(children: [
          // display image in the container
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(color: ColorManager.primary.withOpacity(0.3)),
            ),
            child: Image.network(
             productEntity.imageCover ?? "",
              fit: BoxFit.cover,
              height: isPortrait ? height * 0.142 : height * 0.23,
              width: isPortrait ? width * 0.29 : 165.w,
            ),
          ),
          // SizedBox(width: 8.w),
          // display details product=========================
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p8.w,
                vertical: AppPadding.p8.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // title and delete button ==
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          productEntity?.title ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: getBoldStyle(
                            color: ColorManager.textColor,
                            fontSize: AppSize.s18.sp,
                          ),
                        ),
                      ),
                      BlocConsumer<GetCartCubit, GetCartState>(
                        listenWhen: (previous, current) {
                          if (current is RemoveCartSuccess ||
                              current is RemoveCartError ||
                              current is RemoveCartLoading) {
                            return true;
                          }
                          return false;
                        },
                        buildWhen: (previous, current) {
                          if (current is RemoveCartSuccess ||
                              current is RemoveCartError ||
                              current is RemoveCartLoading) {
                            return true;
                          }
                          return false;
                        },
                        listener: (context, state) {
                          if (state is RemoveCartSuccess &&
                              state.id == productEntity?.id) {
                            Fluttertoast.showToast(
                              msg: state.cart.status ?? "",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.TOP,
                              backgroundColor: Colors.black87,
                              textColor: Colors.white,
                              fontSize: 16.0.sp,
                            );
                          }

                          if (state is RemoveCartError &&
                              state.id ==productEntity?.id) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  alignment: Alignment.bottomCenter,
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [Text(state.error)],
                                  ),
                                );
                              },
                            );
                          }
                        },
                        builder: (context, state) {
                          return state is RemoveCartLoading &&
                                  state.id == productEntity.id
                              ? Center(
                                  child: SizedBox(
                                      height: 15.h,
                                      width: 15.w,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      )),
                                )
                              : InkWell(
                                  onTap: onDeleteTap,
                                  child: Image.asset(
                                    IconsAssets.icDelete,
                                    color: ColorManager.textColor,
                                    height: 22.h,
                                  ),
                                );
                        },
                      )
                    ],
                  ),

                  // SizedBox(height: 7.h),
                  const Spacer(),
                  // display color and size===================
                  // ColorAndSizeCartItem(
                  //   color: Colors.black,
                  //   colorName: "Black",
                  //   size: 40,
                  // ),
                  // const Spacer(),
                  // display price and quantity =================
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'EGP ${cartModel.price! * cartModel.count!}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: getBoldStyle(
                              color: ColorManager.textColor,
                              fontSize: AppSize.s18.sp),
                        ),
                      ),
                      ProductCounter(
                        add: onIncrementTap,
                        productCounter: cartModel.count?.toInt() ?? 0,
                        remove: onDecrementTap,
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
