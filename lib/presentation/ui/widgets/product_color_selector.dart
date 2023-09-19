import 'package:flutter/material.dart';

class ProductColorSelector extends StatefulWidget {
  final void Function(Color color, int index) onChangeColor;
  const ProductColorSelector({
    super.key,
    required this.onChangeColor,
  });

  @override
  State<ProductColorSelector> createState() => _ProductColorSelectorState();
}

class _ProductColorSelectorState extends State<ProductColorSelector> {
  final List<Color> colors = [
    Colors.deepOrange,
    Colors.amber,
    Colors.blue,
    Colors.pink,
    Colors.yellow,
    Colors.black,
  ];
  int selectedColorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: colors.length,
      separatorBuilder: (context, index) => const SizedBox(width: 1),
      itemBuilder: (cntxt, index) {
        return GestureDetector(
          onTap: () {
            if (selectedColorIndex == index) {
              return;
            }
            selectedColorIndex = index;
            widget.onChangeColor(colors[index], index);
            if (mounted) {
              setState(() {});
            }
          },
          child: CircleAvatar(
            radius: 20,
            backgroundColor: colors[index],
            child: index != selectedColorIndex
                ? null
                : const Icon(Icons.done_sharp, color: Colors.white),
          ),
        );
      },
    );
  }
}
