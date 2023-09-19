import 'package:flutter/material.dart';

class ProductSizeSelector extends StatefulWidget {
  final Color selectedColor;
  final void Function(String sizeLabel, int index) onChangeSize;
  const ProductSizeSelector({
    super.key,
    required this.onChangeSize,
    required this.selectedColor,
  });

  @override
  State<ProductSizeSelector> createState() => _ProductSizeSelectorState();
}

class _ProductSizeSelectorState extends State<ProductSizeSelector> {
  final List<String> sizes = [
    'S',
    'M',
    'L',
    'XL',
    'XXL',
    'XXXL',
  ];
  int selectedSizeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: sizes.length,
      separatorBuilder: (context, index) => const SizedBox(width: 2),
      itemBuilder: (cntxt, index) {
        return GestureDetector(
          onTap: () {
            if (selectedSizeIndex == index) {
              return;
            }
            selectedSizeIndex = index;
            widget.onChangeSize(sizes[index], index);
            if (mounted) {
              setState(() {});
            }
          },
          child: Chip(
            backgroundColor:
                selectedSizeIndex == index ? widget.selectedColor : null,
            label: Text(sizes[index]),
          ),
        );
      },
    );
  }
}
