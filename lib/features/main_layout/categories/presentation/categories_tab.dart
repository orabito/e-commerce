import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/categories_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/sub_categories_list.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(
          horizontal: AppPadding.p12, vertical: AppPadding.p12),
      child:  Row(
        children: [
          CategoriesList(),
          SizedBox(
            width: AppSize.s16.w,
          ),
          SubCategoriesList()
        ],
      ),
    );
  }
}
