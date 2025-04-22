import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/features/products_screen/presentation/logic/product_cubit.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/logic/favourite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A button widget that shows a heart icon and handles wishlist functionality
/// It shows a filled heart if the product is in the wishlist, and an empty heart if not
class HeartButton extends StatefulWidget {
  final void Function()? onTap;
  final String productId;

  const HeartButton({super.key, required this.onTap, required this.productId});

  @override
  State<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  @override
  Widget build(BuildContext context) {

    // First BlocBuilder listens to FavouriteCubit to check if product is in wishlist
    return BlocBuilder<FavouriteCubit, FavouriteState>(
      builder: (context, favouriteState) {
        // Default to false if wishlist is not loaded yet
        bool isInWishlist = false;

        // Check if product is in wishlist when wishlist data is loaded
        if (favouriteState is FavouriteSuccessState) {
          isInWishlist = favouriteState.productList
              .any((product) => product.id == widget.productId);
        }

        // Second BlocConsumer listens to ProductCubit for wishlist operation states
        return BlocConsumer<ProductCubit, ProductState>(
          // Only rebuild when wishlist-related states change
          buildWhen: (previous, current) {
            if (current is AddToWishlistErrorState ||
                current is AddToWishlistSuccessState ||
                current is AddToWishlistLoadingState) {
              return true;
            }
            return false;
          },
          // Only listen when wishlist-related states change
          listenWhen: (previous, current) {
            if (current is AddToWishlistErrorState ||
                current is AddToWishlistSuccessState ||
                current is AddToWishlistLoadingState) {
              return true;
            }
            return false;
          },
          // Handle wishlist operation success by refreshing wishlist data
          listener: (context, state) {
            if (state is AddToWishlistSuccessState &&
                state.productId == widget.productId &&
                mounted) {
              // Use Future.microtask to safely refresh wishlist after state update
              Future.microtask(() {
                if (mounted) {
                  context.read<FavouriteCubit>().getFavourite();
                }
              });
            }
          },
          // Build the appropriate UI based on current state
          builder: (context, state) {
            // Show loading indicator when adding/removing from wishlist
            if (state is AddToWishlistLoadingState &&
                state.productId == widget.productId) {
              return Material(
                color: ColorManager.white,
                elevation: 5,
                shape: const StadiumBorder(),
                shadowColor: ColorManager.black,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.primary,
                    ),
                  ),
                ),
              );
            }

            // Show heart icon with appropriate state (filled or empty)
            return InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              onTap: widget.onTap,
              child: Material(
                color: ColorManager.white,
                elevation: 5,
                shape: const StadiumBorder(),
                shadowColor: ColorManager.black,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: ImageIcon(
                    AssetImage(isInWishlist
                        ? IconsAssets.icClickedHeart
                        : IconsAssets.icHeart),
                    color: ColorManager.primary,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
