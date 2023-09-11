import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final ThemeData theme;
  final String title;
  final VoidCallback onTap;
  const SectionHeader({
    super.key,
    required this.theme,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          onPressed: onTap,
          child: const Text('See All'),
        ),
      ],
    );
  }
}
