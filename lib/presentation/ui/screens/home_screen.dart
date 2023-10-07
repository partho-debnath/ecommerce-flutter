import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../state_holders/category_controller.dart';
import '../../state_holders/main_bottom_nav_controller.dart';
import '../../state_holders/new_product_controller.dart';
import '../../state_holders/popular_product_controller.dart';
import '../../state_holders/product_slider_controller.dart';
import '../../state_holders/special_product_controller.dart';
import '../utility/image_assets.dart';
import '../widgets/home/categories.dart';
import '../widgets/home/circular_icon_button.dart';
import '../widgets/home/home_slider.dart';
import '../widgets/product.dart';
import '../widgets/section_header.dart';
import './product_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: SvgPicture.asset(
          ImageAssets.craftBayNavSVG,
          width: 120,
        ),
        actions: <Widget>[
          CircularIconButton(
            onTap: () {},
            icon: Icons.person_2_outlined,
          ),
          const SizedBox(width: 5),
          CircularIconButton(
            onTap: () {},
            icon: Icons.call,
          ),
          const SizedBox(width: 5),
          CircularIconButton(
            onTap: () {},
            icon: Icons.notifications_active,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search',
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GetBuilder<ProductSliderController>(
                builder: (productSliderController) {
                  if (productSliderController.getHomeSlidersInProgress ==
                      true) {
                    return Shimmer.fromColors(
                      baseColor: Colors.black,
                      highlightColor: Colors.grey,
                      child: Container(
                        height: 150.0,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: theme.primaryColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        // alignment: Alignment.center,
                      ),
                    );
                  }
                  return HomeSlider(
                    productSliderModel: productSliderController
                            .productSliderData.productslidermodel ??
                        [],
                  );
                },
              ),
              const SizedBox(height: 10),
              SectionHeader(
                title: 'All Categories',
                onTap: () {
                  Get.find<MainBottomNavController>().changeScreen(1);
                },
                theme: theme,
              ),
              const SizedBox(height: 10),
              GetBuilder<CategoryController>(
                builder: (categoryController) {
                  if (categoryController.getCategoryIsInProgress == true) {
                    return SizedBox(
                      height: 112,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            categoryController.categoryModel.data?.length ?? 0,
                        itemBuilder: (cntxt, index) => Shimmer.fromColors(
                          baseColor: Colors.black,
                          highlightColor: Colors.grey,
                          child: Container(
                            height: 110,
                            width: 110,
                            color: theme.primaryColor.withOpacity(0.1),
                          ),
                        ),
                        separatorBuilder: (cntxt, index) =>
                            const SizedBox(width: 10),
                      ),
                    );
                  }
                  return Categories(
                    categories: categoryController.categoryModel.data ?? [],
                    theme: theme,
                  );
                },
              ),
              const SizedBox(height: 10),
              ...getPopularProduct(theme),
              const SizedBox(height: 10),
              ...getNewProduct(theme),
              const SizedBox(height: 10),
              ...getSpecialProduct(theme),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getPopularProduct(ThemeData theme) {
    return <Widget>[
      SectionHeader(
        title: 'Popular',
        onTap: () {
          // Get.to(
          //   () => const ProductListScreen(
          //     categoryTitle: 'Popular Products',

          //   ),
          // );
        },
        theme: theme,
      ),
      const SizedBox(height: 10),
      SizedBox(
        height: 172,
        child: GetBuilder<PopularProductController>(
          builder: (popularProductController) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:
                  popularProductController.productModel.data?.length ?? 0,
              itemBuilder: (cntxt, index) {
                return Product(
                  product: popularProductController.productModel.data![index],
                  theme: theme,
                );
              },
            );
          },
        ),
      )
    ];
  }

  List<Widget> getNewProduct(ThemeData theme) {
    return <Widget>[
      SectionHeader(
        title: 'New',
        onTap: () {
          // Get.to(
          //   () => const ProductListScreen(
          //     categoryTitle: 'New Products',
          //   ),
          // );
        },
        theme: theme,
      ),
      const SizedBox(height: 10),
      SizedBox(
        height: 172,
        child: GetBuilder<NewProductController>(
          builder: (newProductController) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: newProductController.newProductModel.data?.length ?? 0,
              itemBuilder: (cntxt, index) {
                return Product(
                  product: newProductController.newProductModel.data![index],
                  theme: theme,
                );
              },
            );
          },
        ),
      )
    ];
  }

  List<Widget> getSpecialProduct(ThemeData theme) {
    return <Widget>[
      SectionHeader(
        title: 'Special',
        onTap: () {
          // Get.to(
          //   () => const ProductListScreen(
          //     categoryTitle: 'Special Products',
          //   ),
          // );
        },
        theme: theme,
      ),
      const SizedBox(height: 10),
      SizedBox(
        height: 172,
        child: GetBuilder<SpecialProductController>(
          builder: (specialProductController) => ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:
                specialProductController.specialProductModel.data?.length ?? 0,
            itemBuilder: (cntxt, index) {
              return Product(
                product:
                    specialProductController.specialProductModel.data![index],
                theme: theme,
              );
            },
          ),
        ),
      )
    ];
  }
}
