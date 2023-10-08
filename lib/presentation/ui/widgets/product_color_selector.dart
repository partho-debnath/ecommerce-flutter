import 'package:flutter/material.dart';

class ProductColorSelector extends StatefulWidget {
  final List<Color> colors;
  final void Function(Color color, int index) onChangeColor;
  const ProductColorSelector({
    super.key,
    required this.colors,
    required this.onChangeColor,
  });

  @override
  State<ProductColorSelector> createState() => _ProductColorSelectorState();
}

class _ProductColorSelectorState extends State<ProductColorSelector> {
  int selectedColorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: widget.colors.length,
      separatorBuilder: (context, index) => const SizedBox(width: 1),
      itemBuilder: (cntxt, index) {
        return GestureDetector(
          onTap: () {
            selectedColorIndex = index;
            widget.onChangeColor(widget.colors[index], index);
            if (mounted) {
              setState(() {});
            }
          },
          child: CircleAvatar(
            radius: 20,
            backgroundColor: widget.colors[index],
            child: index != selectedColorIndex
                ? null
                : const Icon(Icons.done_sharp, color: Colors.white),
          ),
        );
      },
    );
  }
}
