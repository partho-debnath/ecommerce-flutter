import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

class ProductImageSlider extends StatefulWidget {
  final List<String> images;
  const ProductImageSlider({super.key, required this.images});

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  final ValueNotifier<int> selectedSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Stack(
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
            height: 320.0,
            autoPlay: true,
            viewportFraction: 1,
            pauseAutoPlayOnTouch: true,
            onPageChanged:
                (int index, CarouselPageChangedReason pageChangedReason) {
              selectedSlider.value = index;
            },
          ),
          items: widget.images.map<Builder>(
            (imageUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                      ),
                    ),
                    alignment: Alignment.center,
                  );
                },
              );
            },
          ).toList(),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
            valueListenable: selectedSlider,
            builder: (context, index, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ...List<Container>.generate(
                    widget.images.length,
                    (i) => Container(
                      width: 12,
                      height: 12,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: i == index ? theme.primaryColor : Colors.white,
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
