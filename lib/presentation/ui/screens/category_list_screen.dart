import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../widgets/category_item.dart';
import './product_list_screen.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Categories',
          style: TextStyle(color: Colors.black),
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
          return FittedBox(
            child: CategoryItem(
              categoryName: 'Category Name$index',
              theme: theme,
              onTap: () {
                Get.to(
                  () => ProductListScreen(categoryTitle: 'Category Name$index'),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
