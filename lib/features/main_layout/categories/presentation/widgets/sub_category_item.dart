import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/manager/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategoryItem extends StatelessWidget {
  final String title;
  final String image;
  final Function navigation;
  const SubCategoryItem(this.title, this.image, this.navigation, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, Routes.productsScreenRoute,arguments:CategoriesCubit.get(context).selectedCategory ),
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AspectRatio(
            aspectRatio:1.4,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s8.r),
                  border: Border.all(color: ColorManager.primary, width: 2.w)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s10.r),
                child:     CachedNetworkImage(imageUrl:image ,
                  fit:BoxFit.cover,
                  width: double.infinity,
                  placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                  const Center(child: Icon(Icons.error)),
                  // imageBuilder: (context, imageProvider) {
                  //   return im
                  // },

                  // image,
                  // fit: BoxFit.cover,
                  // width: double.infinity,
                ),
              ),
            ),
          ),

          Text(
            title,
            maxLines: 2,
            style: getRegularStyle(color: ColorManager.primary),
          )
        ],
      ),
    );
  }
}
