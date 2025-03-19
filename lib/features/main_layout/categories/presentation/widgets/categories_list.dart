import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  // Index of the currently selected category
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        color: ColorManager.containerGray,
        border: Border(
            // set the border for only 3 sides
            top: BorderSide(
                width: AppSize.s2.w,
                color: ColorManager.primary.withOpacity(0.3)),
            left: BorderSide(
                width: AppSize.s2.w,
                color: ColorManager.primary.withOpacity(0.3)),
            bottom: BorderSide(
                width: AppSize.s2.w,
                color: ColorManager.primary.withOpacity(0.3))),
        borderRadius:  BorderRadius.only(
          topLeft: Radius.circular(AppSize.s12.r),
          bottomLeft: Radius.circular(AppSize.s12.r),
        ),
      ),

      // the categories items list
      child: ClipRRect(
        // clip the corners of the container that hold the list view
        borderRadius:  BorderRadius.only(
          topLeft: Radius.circular(AppSize.s12.r),
          bottomLeft: Radius.circular(AppSize.s12.r),
        ),
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) => CategoryItem(index,
              "Laptops & Electronics", selectedIndex == index, onItemClick),
        ),
      ),
    ));
  }

  // callback function to change the selected index
  onItemClick(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
