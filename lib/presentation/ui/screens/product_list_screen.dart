import 'package:flutter/material.dart';

import '../widgets/product.dart';

class ProductListScreen extends StatelessWidget {
  final String categoryTitle;
  const ProductListScreen({
    super.key,
    required this.categoryTitle,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: const BackButton(color: Colors.black),
        title: Text(
          categoryTitle,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(5.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          childAspectRatio: 2.3 / 3,
        ),
        itemCount: 14,
        itemBuilder: (cntxt, index) {
          return FittedBox(
            child: Product(
              theme: theme,
            ),
          );
        },
      ),
    );
  }
}