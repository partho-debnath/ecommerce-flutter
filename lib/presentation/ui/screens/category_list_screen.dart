import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../state_holders/main_bottom_nav_controller.dart';
import '../widgets/category_item.dart';
import './product_list_screen.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return WillPopScope(
      onWillPop: () async {
        Get.find<MainBottomNavController>().backToHomeScreen();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 2,
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavController>().backToHomeScreen();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black54,
            ),
          ),
          title: const Text(
            'Categories',
            style: TextStyle(color: Colors.black54),
          ),
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(5.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemCount: 10,
          itemBuilder: (cntxt, index) {
            return Text('dgd');
            // return FittedBox(
            //   child: CategoryItem(
            //     categoryName: 'Category Name$index',
            //     theme: theme,
            //     onTap: () {
            //       Get.to(
            //         () =>
            //             ProductListScreen(categoryTitle: 'Category Name$index'),
            //       );
            //     },
            //   ),
            // );
          },
        ),
      ),
    );
  }
}
