






import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import '../../../../features/shop/models/temporary_product_model.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../styles/shadows.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../functions/price_english_to_bangla_translator.dart';
import '../../icons/circular_icon.dart';
import '../../images/rounded_image.dart';
import '../../texts/product_title_text.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key,required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
   // final dark = THelperFunctions.isDarkMode(context);
    double parsePrice(String price) {
      // Remove any non-numeric characters except the decimal point
      String cleanedString = price.replaceAll(RegExp(r'[^\d.]'), '');
      // Convert the cleaned string to a double
      return double.parse(cleanedString);
    }
    var price = parsePrice(product.productPrice);

    final formattedPrice = NumberFormat.currency(symbol: "৳", decimalDigits: 2).format(price);
    final bengaliPrice = convertToBengali(formattedPrice);
    final dark = HelperFunctions.isDarkMode(context);




    /// container with side padding, color, edges, radius and shadow.
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [CustomShadowStyle.verticalProductShadow ],
          borderRadius: BorderRadius.circular(Sizes.productImageRadius),
          color: dark ? AppColors.darkerGrey : AppColors.white,
        ), // decoration
        child: Column(
          children: [

            RoundedContainer(
              padding: const EdgeInsets.all(Sizes.sm),
              height: 180,
              backgroundColor: dark ? AppColors.dark : AppColors.light,
              child: Stack(
                children: [
                  // -- Thumbnail Image
                  TRoundedImage(
                      imageurl:  product.productPhoto, applyImageRadius: true),

                  // Sale Tag
                  Positioned(
                    top: 12,
                    child: RoundedContainer(
                      radius: Sizes.sm,
                      backgroundColor: AppColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.sm, vertical: Sizes.xs),
                      child: Text(product.productStarRating,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: Colors.black)),
                    ),
                  ),

                  // Favourite Icon Button
                  Positioned(
                      top: 0,
                      right: 0,
                      child: CircularIcon(
                        icon: Iconsax.heart5,
                        color: Colors.red,
                      )),
                ],
              ),
            ),
            const SizedBox(height: Sizes.spaceBtwItems / 2),
            Padding(
              padding: const EdgeInsets.only(left: Sizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(
                      title: product.productTitle, smallSize: true),
                  const SizedBox(height: Sizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      Text(
                        'Nike',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(width: Sizes.xs),
                      const Icon(Iconsax.verify5,color: AppColors.primary, size: Sizes.iconXs),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Price
                      Text(bengaliPrice,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ), // Text
                      Container(
                        decoration: const BoxDecoration(
                          color: AppColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Sizes.cardRadiusMd),
                            bottomRight: Radius.circular(Sizes.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                          width: Sizes.iconLg * 1.2,
                          height: Sizes.iconLg * 1.2,
                          child: Center(child: Icon(Iconsax.add, color: AppColors.white)),
                        ), // SizedBox
                      ), // Container
                    ],
                  )

                ],
              ),
            )
          ],
        ), // Column
      ),
    );
  }
}
















//
// import 'package:ecommerce_store/common/styles/shadows.dart';
// import 'package:ecommerce_store/common/widgets/custom_shapes/containers/rounded_container.dart';
// import 'package:ecommerce_store/common/widgets/images/rounded_image.dart';
// import 'package:ecommerce_store/common/widgets/texts/brand_title_text_with_verified_icon.dart';
// import 'package:ecommerce_store/common/widgets/texts/product_title_text.dart';
// import 'package:ecommerce_store/features/shop/controllers/product/product_controller.dart';
// import 'package:ecommerce_store/features/shop/models/product_model.dart';
// import 'package:ecommerce_store/features/shop/screens/product_details/product_detail.dart';
// import 'package:ecommerce_store/utils/constants/colors.dart';
// import 'package:ecommerce_store/utils/constants/enums.dart';
// import 'package:ecommerce_store/utils/constants/sizes.dart';
// import 'package:ecommerce_store/utils/helpers/helper_functions.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../texts/product_price_text.dart';
// import '../favourite_icon/favourite_icon.dart';
// import 'product_card_add_to_cart_button.dart';
//
// class ProductCardVertical extends StatelessWidget {
//   const ProductCardVertical({super.key, required this.product});
//
//   final ProductModel product;
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = ProductController.instance;
//     final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
//     final dark = HelperFunctions.isDarkMode(context);
//     return GestureDetector(
//       onTap: () => Get.to(() => ProductDetailScreen(product: product)),
//       child: Container(
//         width: 180,
//         padding: const EdgeInsets.all(1),
//         decoration: BoxDecoration(
//           boxShadow: [CustomShadowStyle.verticalProductShadow],
//           borderRadius: BorderRadius.circular(Sizes.productImageRadius),
//           color: dark ? AppColors.darkerGrey : AppColors.white,
//         ),
//         child: Column(
//           children: [
//             RoundedContainer(
//               width: 180,
//               height: 180,
//               padding: const EdgeInsets.all(Sizes.sm),
//               backgroundColor: dark ? AppColors.dark : AppColors.light,
//               child: Stack(
//                 children: [
//                   Center(child: RoundedImage(imageUrl: product.thumbnail, applyImageRadius: true, isNetworkImage: true)),
//                   if (salePercentage != null)
//                     Positioned(
//                       top: 12,
//                       child: RoundedContainer(
//                         radius: Sizes.sm,
//                         backgroundColor: AppColors.secondary.withOpacity(0.8),
//                         padding: const EdgeInsets.symmetric(horizontal: Sizes.sm, vertical: Sizes.xs),
//                         child: Text('$salePercentage%', style: Theme.of(context).textTheme.labelLarge!.apply(color: AppColors.black)),
//                       ),
//                     ),
//                   Positioned(top: 0, right: 0, child: FavouriteIcon(productId: product.id)),
//                 ],
//               ),
//             ),
//             const SizedBox(height: Sizes.spaceBtwItems / 2),
//             Padding(
//               padding: const EdgeInsets.only(left: Sizes.sm),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   ProductTitleText(title: product.title, smallSize: true),
//                   const SizedBox(height: Sizes.spaceBtwItems / 2),
//                   BrandTitleWithVerifiedIcon(title: product.brand!.name),
//                 ],
//               ),
//             ),
//             const Spacer(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Flexible(
//                   child: Column(
//                     children: [
//                       if (product.productType == ProductType.single.toString() && product.salePrice > 0)
//                         Padding(
//                           padding: const EdgeInsets.only(left: Sizes.sm),
//                           child: Text(
//                             product.price.toString(),
//                             style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
//                           ),
//                         ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: Sizes.sm),
//                         child: ProductPriceText(price: controller.getProductPrice(product)),
//                       ),
//                     ],
//                   ),
//                 ),
//                 ProductCardAddToCartButton(product: product),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
