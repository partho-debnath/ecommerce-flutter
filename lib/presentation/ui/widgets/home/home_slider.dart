import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '../../../../data/models/product_slider_model.dart';
import '../../utility/app_colors.dart';

class HomeSlider extends StatefulWidget {
  final List<ProductSliderModel> productSliderModel;
  const HomeSlider({super.key, required this.productSliderModel});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  final ValueNotifier<int> selectedSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
            height: 150.0,
            autoPlay: true,
            viewportFraction: 1,
            pauseAutoPlayOnTouch: true,
            onPageChanged:
                (int index, CarouselPageChangedReason pageChangedReason) {
              selectedSlider.value = index;
            },
          ),
          items: widget.productSliderModel.map<Builder>(
            (ProductSliderModel productSliderModel) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: theme.primaryColor.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image.network(
                          productSliderModel.image,
                          width: 200.0,
                          height: 150.0,
                          fit: BoxFit.cover,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            FittedBox(
                              child: Text(
                                productSliderModel.title,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            FittedBox(
                              child: Text(
                                productSliderModel.price,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: theme.primaryColor,
                                maximumSize: const Size.fromHeight(30),
                                minimumSize: const Size(100, 20),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                textStyle: const TextStyle(fontSize: 12),
                              ),
                              onPressed: () {
                                log('${productSliderModel.id}');
                              },
                              child: const Text('Buy Now'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ).toList(),
        ),
        const SizedBox(height: 10),
        ValueListenableBuilder(
          valueListenable: selectedSlider,
          builder: (context, index, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ...List<Container>.generate(
                  widget.productSliderModel.length,
                  (i) => Container(
                    width: 10,
                    height: 10,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                      color: i == index ? AppColor.primaryColor : null,
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ],
    );
  }
}
