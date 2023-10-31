import 'dart:developer';

import 'package:ecommerce/presentation/ui/utility/color_extension.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../state_holders/add_to_cart_controller.dart';
import '../../state_holders/product_details_controller.dart';
import '../../state_holders/wish_list_controller.dart';
import '../widgets/product_color_selector.dart';
import '../widgets/product_image_slider.dart';
import '../widgets/product_size_selector.dart';
import '../widgets/stepper_counter.dart';
import './review_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;
  const ProductDetailsScreen({
    super.key,
    required this.productId,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _selectedColorIndex = 0;
  int _selectedSizeIndex = 0;
  int _quantity = 1;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<ProductDetailsController>()
          .getProductDetails(widget.productId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log(widget.productId.toString());
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: GetBuilder<ProductDetailsController>(
        builder: (productDetailsController) {
          if (productDetailsController.getProductDetailsIsInProgress) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          return Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ProductImageSlider(images: productDetailsController.images),
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
              productDescription(
                productDetailsController: productDetailsController,
                theme: theme,
              ),
              productAddToCartButtom(
                productDetailsController: productDetailsController,
                theme: theme,
              ),
            ],
          );
        },
      ),
    );
  }

  Expanded productDescription({
    required ProductDetailsController productDetailsController,
    required ThemeData theme,
  }) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      productDetailsController.productDetails.product?.title ??
                          '',
                      style: const TextStyle(
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
                      _quantity = value;
                      log(value.toString());
                    },
                  ),
                ],
              ),
              productReview(
                productDetailsController.productDetails.product?.star ?? 0,
                theme,
              ),
              contentHeader(title: 'Color'),
              const SizedBox(height: 10),
              // SizedBox(
              //   height: 28,
              //   child: ProductColorSelector(
              //     colors: productDetailsController.availableColors,
              //     onChangeColor: (color, index) {
              //       log(index.toString());
              //       _selectedColorIndex = index;
              //       // color.toHex();
              //     },
              //   ),
              // ),
              SizedBox(
                height: 30,
                child: ProductSizeSelector(
                  sizes: productDetailsController.availableColorsAsString,
                  selectedColor: theme.primaryColor,
                  onChangeSize: (sizeLabel, index) {
                    _selectedColorIndex = index;
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
                  sizes: productDetailsController.availableSizes ?? [],
                  selectedColor: theme.primaryColor,
                  onChangeSize: (sizeLabel, index) {
                    _selectedSizeIndex = index;
                    log(sizeLabel);
                    log(index.toString());
                  },
                ),
              ),
              const SizedBox(height: 15),
              contentHeader(title: 'Description'),
              const SizedBox(height: 10),
              Text(
                productDetailsController.productDetails.des ?? '',
                textScaleFactor: 1.2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container productAddToCartButtom({
    required ProductDetailsController productDetailsController,
    required ThemeData theme,
  }) {
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
                '\$${productDetailsController.productDetails.product?.price}',
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
            child: GetBuilder<AddToCartController>(
              builder: (addToCartController) {
                if (addToCartController.addToCartInProgress) {
                  return ElevatedButton.icon(
                    onPressed: null,
                    icon: const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(),
                    ),
                    label: const Text('Add to cart'),
                  );
                }
                return ElevatedButton(
                  onPressed: () {
                    addToCartController
                        .addToCart(
                      productDetailsController.productDetails.id!,
                      productDetailsController
                          .availableColorsAsString[_selectedColorIndex],
                      productDetailsController
                          .availableSizes![_selectedSizeIndex],
                      _quantity,
                    )
                        .then((value) {
                      if (value == false) {
                        Get.snackbar(
                          'Failed!.',
                          'Product add to cart failed. Try again later.',
                          backgroundColor: Colors.red,
                        );
                        return;
                      }
                      Get.snackbar(
                        'Success!',
                        'This product added to your cart list.',
                        icon: const Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 30,
                        ),
                        backgroundColor: theme.primaryColor,
                      );
                    });
                  },
                  child: const Text('Add to cart'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Row productReview(int productRating, ThemeData theme) {
    return Row(
      children: <Widget>[
        Wrap(
          children: <Widget>[
            const Icon(
              Icons.star,
              size: 18,
              color: Colors.amber,
            ),
            Text(
              '$productRating',
              style: const TextStyle(
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
            Get.to(() => ReviewScreen(productId: widget.productId));
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
        GestureDetector(
            onTap: () {
              Get.find<WishListController>()
                  .addProductToWishlist(widget.productId)
                  .then((value) {
                if (value == true) {
                  Get.snackbar(
                    'Success!',
                    'Product added in wishlist.',
                    backgroundColor: Colors.green,
                  );
                } else {
                  Get.snackbar(
                    'Failed!',
                    'Product added failed!',
                    backgroundColor: Colors.red,
                  );
                }
              });
            },
            child: Card(
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
            )),
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
