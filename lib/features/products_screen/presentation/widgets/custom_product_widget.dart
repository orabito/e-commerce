import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/widget/heart_button.dart';
import 'package:ecommerce_app/features/products_screen/domain/entity/ProductEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../logic/product_cubit.dart';

class CustomProductWidget extends StatelessWidget {
  final double width;
  final double height;

  final ProductEntity productEntity;

//edit
  const CustomProductWidget({
    super.key,
    required this.productEntity,
    required this.width,
    required this.height,
  });

  String truncateTitle(String title) {
    List<String> words = title.split(' ');
    if (words.length <= 2) {
      return title;
    } else {
      return "${words.sublist(0, 2).join(' ')}..";
    }
  }

  String truncateDescription(String description) {
    List<String> words = description.split(RegExp(r'[\s-]+'));
    if (words.length <= 4) {
      return description;
    } else {
      return "${words.sublist(0, 4).join(' ')}..";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, Routes.productDetails,
          arguments: productEntity),
      child: Container(
        width: width * 0.4,
        height: height * 0.3,
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorManager.primary.withValues(alpha: 0.3),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  // Not working with the lastest flutter version

                  CachedNetworkImage(
                    imageUrl: productEntity.imageCover ?? "",
                    height: height * 0.15,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        height: height * 0.15,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(14.r)),
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover)),
                      );
                    },
                  ),
                  // Image.network(
                  //   image,
                  //   fit: BoxFit.cover,
                  // ),
                  // ClipRRect(
                  //   borderRadius:
                  //       BorderRadius.vertical(top: Radius.circular(14.r)),
                  //   child: Image.asset(
                  //     image,
                  //     fit: BoxFit.cover,
                  //     width: width,
                  //   ),
                  // ),
                  Positioned(
                      top: height * 0.01,
                      right: width * 0.02,
                      child: HeartButton(
                        onTap: () {
                          ProductCubit.get(context)
                              .addToWishlist(productEntity.id!);
                        },
                        productId: productEntity.id!,
                      )),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      maxLines: 2,
                      truncateTitle(productEntity.title ?? ""),
                      style: getMediumStyle(
                        color: ColorManager.textColor,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: height * 0.002),
                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      truncateDescription(productEntity.description ?? ""),
                      style: getRegularStyle(
                        color: ColorManager.textColor,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: height * 0.001),
                    SizedBox(
                      width: width * 0.3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            NumberFormat.simpleCurrency(
                              name: "EGP",
                            ).format(productEntity.price),
                            style: getRegularStyle(
                              color: ColorManager.textColor,
                              fontSize: 14.sp,
                            ),
                          ),
                          Text(
                            "${productEntity.quantity} ",
                            style: getTextWithLine(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.005),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          // width: width * 0.22,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "Review (${productEntity.ratingsAverage})",
                                  style: getRegularStyle(
                                    color: ColorManager.textColor,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.star_rate_rounded,
                                color: ColorManager.starRateColor,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          child: BlocConsumer<ProductCubit, ProductState>(
                            listenWhen: (previous, current) {
                              if (current is AddToCartSuccessState ||
                                  current is AddToCartErrorState ||
                                  current is AddToCartLoadingState) {
                                return true;
                              }
                              return false;
                            },
                            buildWhen: (previous, current) {
                              if (current is AddToCartSuccessState ||
                                  current is AddToCartErrorState ||
                                  current is AddToCartLoadingState) {
                                return true;
                              }
                              return false;
                            },
                            listener: (context, state) {
                              if (state is AddToCartSuccessState &&
                                  state.productId == productEntity.id) {
                                // ScaffoldMessenger.of(context)
                                //     .showSnackBar(SnackBar(
                                //         behavior: SnackBarBehavior.floating,
                                //         content: Container(
                                //           alignment: Alignment.center,
                                //           child: Text(
                                //               state.addCartEntity.message ??
                                //                   ""),
                                //         )));

                                //package =>
                                Fluttertoast.showToast(
                                  msg:   state.addCartEntity.message ??"",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.TOP,
                                  backgroundColor: Colors.black87,
                                  textColor: Colors.white,
                                  fontSize: 16.0.sp,
                                );
                              }
                              if (state is AddToCartErrorState&&state.productId==productEntity.id) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      alignment: Alignment.bottomCenter,
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [Text(state.error)],
                                      ),
                                    );
                                  },
                                );
                              }
                            },
                            builder: (context, state) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: InkWell(
                                  onTap: () {
                                    ProductCubit.get(context)
                                        .addToCart(productEntity.id!);
                                  },
                                  child: Container(
                                    height: height * 0.036,
                                    width: width * 0.08,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ColorManager.primary,
                                    ),
                                    child: state is AddToCartLoadingState &&
                                            state.productId == productEntity.id
                                        ? Center(
                                            child: SizedBox(
                                                height: 15.h,
                                                width: 15.w,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                )),
                                          )
                                        : const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
