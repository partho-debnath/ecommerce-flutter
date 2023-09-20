import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../widgets/product_color_selector.dart';
import '../widgets/product_image_slider.dart';
import '../widgets/product_size_selector.dart';
import '../widgets/stepper_counter.dart';
import './review_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              const ProductImageSlider(),
              AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: const BackButton(color: Colors.black54),
                title: const Text(
                  'Product Details',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ],
          ),
          productDescription(theme),
          productAddToCartButtom(theme),
        ],
      ),
    );
  }

  Container productAddToCartButtom(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: theme.primaryColor.withOpacity(0.1),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Price',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '\$12000',
                style: TextStyle(
                  fontSize: 18,
                  color: theme.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Add to cart'),
            ),
          ),
        ],
      ),
    );
  }

  Expanded productDescription(ThemeData theme) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  const Expanded(
                    child: Text(
                      'Addidas Shoe KJHg232 - Black Edition.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  StepperCounter(
                    color: theme.primaryColor,
                    startingValue: 1,
                    lowerLimit: 1,
                    upperLimit: 10,
                    onChange: (value) {
                      log(value.toString());
                    },
                  ),
                ],
              ),
              productReview(theme),
              contentHeader(title: 'Color'),
              const SizedBox(height: 10),
              SizedBox(
                height: 28,
                child: ProductColorSelector(
                  onChangeColor: (color, index) {
                    log(index.toString());
                  },
                ),
              ),
              const SizedBox(height: 15),
              contentHeader(title: 'Size'),
              const SizedBox(height: 10),
              SizedBox(
                height: 30,
                child: ProductSizeSelector(
                  selectedColor: theme.primaryColor,
                  onChangeSize: (sizeLabel, index) {
                    log(sizeLabel);
                    log(index.toString());
                  },
                ),
              ),
              const SizedBox(height: 15),
              contentHeader(title: 'Description'),
              const SizedBox(height: 10),
              const Text(
                '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem  Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row productReview(ThemeData theme) {
    return Row(
      children: <Widget>[
        const Wrap(
          children: <Widget>[
            Icon(
              Icons.star,
              size: 18,
              color: Colors.amber,
            ),
            Text(
              '4.5',
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.blueGrey,
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            Get.to(() => const ReviewScreen());
          },
          child: Text(
            'Review',
            style: TextStyle(
              fontSize: 15,
              color: theme.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Card(
          color: theme.primaryColor,
          elevation: 4,
          child: const Padding(
            padding: EdgeInsets.all(4.0),
            child: Icon(
              Icons.favorite_border,
              size: 16,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Text contentHeader({required String title}) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
