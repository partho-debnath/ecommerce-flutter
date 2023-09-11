import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  const CircularIconButton({
    super.key,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey.shade100,
      radius: 20,
      child: IconButton(
        onPressed: onTap,
        icon: Icon(
          icon,
          size: 20,
        ),
      ),
    );
  }
}
