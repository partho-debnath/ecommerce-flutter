import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '../../utility/app_colors.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  final ValueNotifier<int> selectedSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
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
          items: [1, 2, 3, 4, 5].map<Builder>(
            (i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'text $i',
                      style: const TextStyle(fontSize: 16.0),
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
                  5,
                  (i) => Container(
                    width: 10,
                    height: 10,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
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
