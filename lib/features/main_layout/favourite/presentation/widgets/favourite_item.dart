import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/widget/heart_button.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/widgets/add_to_cart_button.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/widgets/favourite_item_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../products_screen/domain/entity/ProductEntity.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.productDetails, arguments: product);
      },
      child: Container(
        height: AppSize.s135.h,
        padding: REdgeInsets.only(right: AppSize.s8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s16.r),
            border: Border.all(color: ColorManager.primary.withOpacity(.3))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s16.r),
                  border:
                      Border.all(color: ColorManager.primary.withOpacity(.6))),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s16.r),
                child: CachedNetworkImage(
                  width: AppSize.s120.w,
                  height: AppSize.s135.h,
                  fit: BoxFit.cover,
                  imageUrl: product.imageCover!,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.primary,
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    color: ColorManager.primary,
                  ),
                ),
              ),
            ),
            Expanded(
                child: Padding(
                    padding: REdgeInsets.only(left: AppSize.s8),
                    child: FavouriteItemDetails(
                      product: product,
                    ))),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                HeartButton(
                    productId: product.id ?? "",
                    onTap: () {
                      //TODO:remove product from wish list
                    }),
                SizedBox(height: AppSize.s14.h),
                AddToCartButton(
                  onPressed: () {
                    //TODO:add product to cart
                  },
                  text: AppConstants.addToCart,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
