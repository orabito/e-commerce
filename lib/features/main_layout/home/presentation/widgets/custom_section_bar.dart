import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/styles_manager.dart';

class CustomSectionBar extends StatelessWidget {
  final String sectionNname;
  final Function function;
  const CustomSectionBar(
      {super.key, required this.sectionNname, required this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            sectionNname,
            style: getMediumStyle(
              fontSize: 18.sp,
              color: ColorManager.darkBlue,
            ),
          ),
          TextButton(
            onPressed: () {
              function();
            },
            child: Text(
              'view all',
              style: getMediumStyle(color: ColorManager.darkBlue),
            ),
          ),
        ],
      ),
    );
  }
}
