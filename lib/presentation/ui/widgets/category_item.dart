import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final ThemeData theme;
  final String categoryName;
  final VoidCallback onTap;
  const CategoryItem({
    super.key,
    required this.theme,
    required this.categoryName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(5.0),
            onTap: onTap,
            child: Container(
              height: 84.0,
              width: 84.0,
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: theme.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: const FlutterLogo(
                size: 50,
                textColor: Colors.red,
              ),
            ),
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
