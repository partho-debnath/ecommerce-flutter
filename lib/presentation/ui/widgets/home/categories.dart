import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/category_data.dart';
import '../../screens/product_list_screen.dart';
import '../category_item.dart';

class Categories extends StatelessWidget {
  final ThemeData theme;
  final List<CategoryData> categories;
  const Categories({
    super.key,
    required this.theme,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryItem(
            category: categories[index],
            theme: theme,
            onTap: () {
              Get.to(
                () => ProductListScreen(
                  categoryTitle: 'Category Name$index',
                ),
              );
            },
          );
        },
      ),
    );
  }
}
