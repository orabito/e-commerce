import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/manager/categories_cubit.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/categories_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/sub_categories_list.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
        getIt.get<CategoriesCubit>()
          ..getCategories(),
        child: BlocBuilder<CategoriesCubit, CategoriesState>(
        buildWhen: (previous, current)
    {
      if (current is CategoriesSuccessState ||
          current is CategoriesErrorState ||
                current is CategoriesLoadingState) {
              return true;
            }
            return false;
          },
          builder: (context, state) {
            if (state is CategoriesSuccessState) {
              return Padding(
                padding: REdgeInsets.symmetric(
                    horizontal: AppPadding.p12, vertical: AppPadding.p12),
                child: Row(
                  children: [
                    CategoriesList(
                      categories: state.categoriesEntity.data ?? [],
                    ),
                    SizedBox(
                      width: AppSize.s16.w,
                    ),
                    SubCategoriesList()
                  ],
                ),
              );
            }
            if (state is CategoriesErrorState) {
              return Center(
                child: Text(state.error),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
  }
