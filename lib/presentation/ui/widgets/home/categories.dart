import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return CategoryItem(
            categoryName: 'Name $index',
            theme: theme,
          );
        },
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final ThemeData theme;
  final String categoryName;
  const CategoryItem({
    super.key,
    required this.theme,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: 84.0,
          width: 84.0,
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.all(10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: theme.primaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: const FlutterLogo(
            size: 50,
            textColor: Colors.red,
          ),
        ),
        Text(
          categoryName,
          style: TextStyle(
            color: theme.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
