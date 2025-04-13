import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/styles_manager.dart';
import '../../domain/entity/brand_entity/Brand_entity.dart';

class CustomBrandWidget extends StatelessWidget {
  const CustomBrandWidget({super.key,required this.brandEntity});
final BrandEntity brandEntity;
  @override
  Widget build(BuildContext context) {
    return
    Column(
      children: [
        CachedNetworkImage(
          height: 80,
          width: 80,
          fit: BoxFit.cover,
          imageUrl: brandEntity.image??ImageAssets.categoryHomeImage,
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error)),
          imageBuilder: (context, imageProvider) {
            return Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
        SizedBox(height: 8.h),
        Text(
          brandEntity.name!,
          style: getRegularStyle(color: ColorManager.darkBlue, fontSize: 14.sp),
        ),
      ],

    );



  }
}

//   Column(
//   children: [
//     ClipRRect(
//       borderRadius: BorderRadius.circular(100.r),
//       child: Container(
//         height: 100.h,
//         width: 100.w,
//         decoration: const BoxDecoration(
//           shape: BoxShape.circle,
//         ),
//         child: Image.asset(
//           ImageAssets.brandHomeImage,
//           fit: BoxFit.scaleDown,
//         ),
//       ),
//     ),
//   ],
// );
