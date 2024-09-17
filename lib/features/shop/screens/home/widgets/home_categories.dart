// import 'package:ecommerce_store/features/shop/controllers/category_controller.dart';
// import 'package:ecommerce_store/features/shop/screens/sub_category/sub_categories.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../../utils/constants/image_strings.dart'; // Assuming this is where your image assets are defined

import '../../../controllers/product/product_controller.dart';
import '../../../controllers/temporary_produc_controller_by_api_service.dart';
import '../../../models/temporary_product_model.dart';

class HomeCategories extends StatelessWidget {
  HomeCategories({
    Key? key,
  }) : super(key: key);

  final ProductController productController = Get.put(ProductController());

  String getCategoryImage(Category category) {
    switch (category) {
      case Category.ELECTRONICS:
        return ImageStrings.electronicsIcon;
      case Category.JEWELERY:
        return ImageStrings.jeweleryIcon;
      case Category.MEN_S_CLOTHING:
        return ImageStrings.shoeIcon;
      case Category.WOMEN_S_CLOTHING:
        return ImageStrings.clothIcon;
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (productController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        List<Category> categories = Category.values;

        return SizedBox(
          height: 85,
          child: ListView.builder(
            shrinkWrap: false,
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              Category category = categories[index];
              String categoryImage = getCategoryImage(category);

              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: VerticalImageText(
                  image: categoryImage,
                  title: category.toString().split('.').last,
                  onTap: () {
                    // Handle onTap event
                  },
                ),
              );
            },
          ),
        );
      }
    });
  }
}




// import '../../../../../common/widgets/shimmers/category_shimmer.dart';
//
// class HomeCategories extends StatelessWidget {
//   const HomeCategories({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final categoryController = Get.put(CategoryController());
//     return Obx(
//       () {
//         if (categoryController.isLoading.value) return const CustomCategoryShimmer();
//
//         if (categoryController.featuredCategories.isEmpty) {
//           return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
//         }
//
//         return SizedBox(
//           height: 80,
//           child: ListView.builder(
//             itemCount: categoryController.featuredCategories.length,
//             scrollDirection: Axis.horizontal,
//             shrinkWrap: true,
//             itemBuilder: (_, index) {
//               final category = categoryController.featuredCategories[index];
//               return VerticalImageText(
//                 image: category.image,
//                 title: category.name,
//                 onTap: () => Get.to(() => SubCategoriesScreen(category: category)),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }
