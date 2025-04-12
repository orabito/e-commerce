import 'dart:async';
import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/manager/home_cubit.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/widgets/custom_brand_widget.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/widgets/custom_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import 'widgets/custom_ads_widget.dart';
import 'widgets/custom_section_bar.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _currentIndex = 0;
  late Timer _timer;

  final List<String> adsImages = [
    ImageAssets.carouselSlider1,
    ImageAssets.carouselSlider2,
    ImageAssets.carouselSlider3,
  ];

  @override
  void initState() {
    super.initState();
    _startImageSwitching();
  }

  void _startImageSwitching() {
    _timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % adsImages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      getIt.get<HomeCubit>()
        ..getCategories()
        ..getBrands(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomAdsWidget(
              adsImages: adsImages,
              currentIndex: _currentIndex,
              timer: _timer,
            ),
            Column(
              children: [
                CustomSectionBar(sectionNname: 'Categories', function: () {}),
                BlocBuilder<HomeCubit, HomeState>(
                  buildWhen: (previous, current) {
                    if (current is HomeCategoriesSuccessState ||
                        current is HomeCategoriesLoadingState ||
                        current is HomeCategoriesErrorState) {
                      return true;
                    }
                    return false;
                  },
                  builder: (context, state) {
                    if (state is HomeCategoriesSuccessState) {
                      var categoriesEntity = state.categoriesEntity;
                      return SizedBox(
                        height: 270.h,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CustomCategoryWidget(
                              categoryEntity: categoriesEntity.data![index],
                            );
                          },
                          itemCount: categoriesEntity.data?.length ?? 0,

                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                        ),
                      );
                    }
                    if (state is HomeCategoriesErrorState) {
                      return Center(child: Text(state.errorMassage),);
                    }

                      return Center(
                        child: CircularProgressIndicator(

                        ),);

                  },
                ),


                SizedBox(height: 12.h),
                CustomSectionBar(sectionNname: 'Brands', function: () {}),
                BlocBuilder<HomeCubit, HomeState>(
                  buildWhen: (previous, current) {
                    if (current is HomeBrandsSuccessState ||
                        current is HomeBrandsLoadingState ||
                        current is HomeBrandsErrorState) {
                      return true;
                    }
                    return false;
                  } ,
                  builder: (context, state) {
                    if(state is HomeBrandsSuccessState){
                      return SizedBox(
                        height: 270.h,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CustomBrandWidget(
                              brandEntity: state.brandsEntity.data![index],
                            );
                          },
                          itemCount: state.brandsEntity.data!.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                        ),
                      );

                    }
                    if (state is HomeBrandsErrorState) {
                      return Center(child: Text(state.error),);
                    }

                    return Center(
                      child: CircularProgressIndicator(

                      ),);

                  },
                ),
                // CustomSectionBar(
                //   sectionNname: 'Most Selling Products',
                //   function: () {},
                // ),
                // SizedBox(
                //   child: SizedBox(
                //     height: 360.h,
                //     child: ListView.builder(
                //       scrollDirection: Axis.horizontal,
                //       itemBuilder: (context, index) {
                //         return const ProductCard(
                //           title: "Nike Air Jordon",
                //           description:
                //           "Nike is a multinational corporation that designs, develops, and sells athletic footwear ,apparel, and accessories",
                //           rating: 4.5,
                //           price: 1100,
                //           priceBeforeDiscound: 1500,
                //           image: ImageAssets.categoryHomeImage,
                //         );
                //       },
                //       itemCount: 20,
                //     ),
                //   ),
                // ),
                SizedBox(height: 12.h),
              ],
            )
          ],
        ),
      ),
    );
  }
}
