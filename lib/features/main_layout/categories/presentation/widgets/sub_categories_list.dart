import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/font_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/manager/categories_cubit.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/category_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'sub_category_item.dart';

class SubCategoriesList extends StatelessWidget {
  const SubCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: CustomScrollView(
        slivers: <Widget>[
          // category title
          BlocBuilder<CategoriesCubit, CategoriesState>(
            buildWhen: (previous, current) {
              if (current is CategoriesNewState) {
                return true;
              }
              return false;
            },
            builder: (context, state) {
              return SliverToBoxAdapter(
                child: Text(
                  CategoriesCubit.get(context).selectedCategory?.name ?? "",
                  style: getBoldStyle(
                      color: ColorManager.primary, fontSize: FontSize.s14.sp),
                ),
              );
            },
          ),
          // the category card
          BlocBuilder<CategoriesCubit, CategoriesState>(
            buildWhen: (previous, current) {
              if (current is CategoriesNewState) {
                return true;
              }
              return false;
            },
            builder: (context, state) {
              return SliverToBoxAdapter(
                child: CategoryCardItem(
                    CategoriesCubit.get(context).selectedCategory?.name ?? "",
                    CategoriesCubit.get(context).selectedCategory?.image ?? "",
                    goToCategoryProductsListScreen),
              );
            },
          ),
          // the grid view of the subcategories
          BlocBuilder<CategoriesCubit, CategoriesState>(
            buildWhen: (previous, current) {
              if (current is SubCategoriesSuccessState ||
                  current is SubCategoriesErrorState ||
                  current is SubCategoriesLoadingState) {
                return true;
              }
              return false;
            },
            builder: (context, state) {
              if (state is SubCategoriesSuccessState) {
                if(( state.subCategoriesEntity.data?.length??0)==0){
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        "No Sub Categories",
                        overflow: TextOverflow.ellipsis,
                        style: getRegularStyle(color: ColorManager.primary).copyWith(
                          fontSize: 20.sp

                        ),
                      )
                    )
                  );
                }
                return SliverGrid(


                    delegate: SliverChildBuilderDelegate(

                      childCount:  state.subCategoriesEntity.data?.length??0,
                      (context, index) => SubCategoryItem(
                          state.subCategoriesEntity.data?[index].name ?? "",
                          CategoriesCubit.get(context)
                                  .selectedCategory
                                  ?.image ??
                              ImageAssets.subcategoryCardImage,
                          goToCategoryProductsListScreen),
                    ),
                    gridDelegate:
                         SliverGridDelegateWithFixedCrossAxisCount(



                      crossAxisCount: 2,
                           childAspectRatio: .9,
                      mainAxisSpacing: AppSize.s8,
                      crossAxisSpacing: AppSize.s8,
                    ));
              }
              if (state is SubCategoriesErrorState) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text(state.error),
                  ),
                );
              }
              return SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  goToCategoryProductsListScreen() {
    // todo implement this function
  }
}
