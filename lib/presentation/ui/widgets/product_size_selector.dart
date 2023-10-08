import 'package:flutter/material.dart';

class ProductSizeSelector extends StatefulWidget {
  final List<String> sizes;
  final Color selectedColor;
  final void Function(String sizeLabel, int index) onChangeSize;
  const ProductSizeSelector({
    super.key,
    required this.sizes,
    required this.onChangeSize,
    required this.selectedColor,
  });

  @override
  State<ProductSizeSelector> createState() => _ProductSizeSelectorState();
}

class _ProductSizeSelectorState extends State<ProductSizeSelector> {
  int selectedSizeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: widget.sizes.length,
      separatorBuilder: (context, index) => const SizedBox(width: 2),
      itemBuilder: (cntxt, index) {
        return GestureDetector(
          onTap: () {
            selectedSizeIndex = index;
            widget.onChangeSize(widget.sizes[index], index);
            if (mounted) {
              setState(() {});
            }
          },
          child: Chip(
            backgroundColor:
                selectedSizeIndex == index ? widget.selectedColor : null,
            label: Text(widget.sizes[index]),
          ),
        );
      },
    );
  }
}
