import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entity/categories_entity/category_entity.dart';
import 'package:ecommerce_app/features/products_screen/presentation/widgets/custom_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widget/home_screen_app_bar.dart';
import '../logic/product_cubit.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key, required this.categoryEntity});

  final CategoryEntity categoryEntity;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductCubit>()
      ..getProductFromCategory(widget.categoryEntity.id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
//ProductCubit.get(context).getProductFromCategory(categoryEntity.id??"");

    return Scaffold(
      appBar: const HomeScreenAppBar(
        automaticallyImplyLeading: true,
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        buildWhen: (previous, current) {
          if (current is ProductSuccessState ||
              current is ProductLoadingState || current is ProductErrorState) {
            return true;
          }
          return false;
        },
        builder: (context, state) {
          if (state is ProductSuccessState) {
            var products = state.entity.data;
            return Padding(
              padding: REdgeInsets.all(AppPadding.p16),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      itemCount: products?.length ?? 0,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 7 / 9,
                      ),
                      itemBuilder: (context, index) {
                        return CustomProductWidget(
                          productEntity: products![index],
                          height: height,
                          width: width,
                        );
                      },
                      scrollDirection: Axis.vertical,
                    ),
                  )
                ],
              ),
            );
          }
          if (state is ProductErrorState) {
            return Center(child: Text(state.error),);
          }
          return const Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
}
