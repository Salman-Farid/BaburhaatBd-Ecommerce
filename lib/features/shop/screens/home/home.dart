import 'package:ecommerce_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/temporary_produc_controller_by_api_service.dart';
import 'widgets/home_appbar.dart';
import 'widgets/home_categories.dart';
import 'widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {


    //final controller = Get.put(ProductController());
    final TProductController productController = Get.put(TProductController());
    return Scaffold(
    body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  const HomeAppBar(),
                  const SizedBox(height: Sizes.spaceBtwSections),
                  const SearchContainer(text: 'Search In Store'),
                  const SizedBox(height: Sizes.spaceBtwSections),
                  Padding(
                    padding: const EdgeInsets.only(left: Sizes.defaultSpace),
                    child: Column(
                      children: [
                        const SectionHeading(title: 'Popular Categories', showActionButton: false, textColor: Colors.white),
                        const SizedBox(height: Sizes.spaceBtwItems),
                        HomeCategories(),
                      ],
                    ),
                  ),
                  const SizedBox(height: Sizes.spaceBtwSections),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Sizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(
                    banners: [
                      ImageStrings.promoBanner1,
                      ImageStrings.promoBanner2,
                      ImageStrings.promoBanner3
                    ],
                  ),
                  //const PromoSlider(),
                  // const SizedBox(height: Sizes.spaceBtwSections),
                  // SectionHeading(
                  //   title: 'Popular Products',
                  //   onPressed: () => Get.to(
                  //     () => AllProducts(
                  //       title: 'Popular Products',
                  //       futureMethod: TProductController.fetchAllFeaturedProducts(),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: Sizes.spaceBtwItems),
                  Obx(() {
                    if (productController.isLoading.value) return const VerticalProductShimmer();

                    if (productController.products.isEmpty) {
                      return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium));
                    }
                    return GridLayout(
                      itemCount: productController.products.length,

                      //itemBuilder: (_, index) => ProductCardVertical(product:productController.productList[index]),
                      itemBuilder: (_, index) {
                        //Product product = productController.productList[index];
                        return ProductCardVertical(product: productController.products[index]);
                      },
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
