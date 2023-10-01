import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../state_holders/category_controller.dart';
import '../../state_holders/main_bottom_nav_controller.dart';
import '../../state_holders/product_slider_controller.dart';
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
                  log('==');
                  log(productSliderController.getHomeSlidersInProgress
                      .toString());
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
                builder: (categoryController) => Categories(
                  categories: categoryController.categoryModel.data ?? [],
                  theme: theme,
                ),
              ),
              const SizedBox(height: 10),
              SectionHeader(
                title: 'Popular',
                onTap: () {
                  Get.to(
                    () => const ProductListScreen(
                      categoryTitle: 'Popular Products',
                    ),
                  );
                },
                theme: theme,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 172,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (cntxt, index) {
                    return Product(theme: theme);
                  },
                ),
              ),
              const SizedBox(height: 10),
              SectionHeader(
                title: 'Special',
                onTap: () {
                  Get.to(
                    () => const ProductListScreen(
                      categoryTitle: 'Special Products',
                    ),
                  );
                },
                theme: theme,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 172,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (cntxt, index) {
                    return Product(theme: theme);
                  },
                ),
              ),
              const SizedBox(height: 10),
              SectionHeader(
                title: 'New',
                onTap: () {
                  Get.to(
                    () => const ProductListScreen(
                      categoryTitle: 'New Products',
                    ),
                  );
                },
                theme: theme,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 172,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (cntxt, index) {
                    return Product(theme: theme);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
