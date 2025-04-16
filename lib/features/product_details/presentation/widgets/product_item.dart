import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/widget/heart_button.dart';
import 'package:ecommerce_app/features/products_screen/domain/entity/ProductEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key,required this.productEntity,  this.onTap});
  // final String imageUrl;required this.imageUrl
final  ProductEntity productEntity;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: productEntity.imageCover??"",
      imageBuilder: (context, image) => Container(
        width: double.infinity,
        padding:  REdgeInsets.all(16),
        height: 300.h,
        decoration: BoxDecoration(
          image: DecorationImage(image: image, fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(15.r),
        ),
        alignment: Alignment.topRight,
        child: HeartButton(

          productId:productEntity.id!,
          onTap: onTap,
        ),
      ),
    );
  }
}
