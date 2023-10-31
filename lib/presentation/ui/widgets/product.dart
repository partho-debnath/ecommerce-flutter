import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/models/product_data.dart';
import '../../state_holders/wish_list_controller.dart';
import '../screens/product_details_screen.dart';

class Product extends StatelessWidget {
  final ProductData product;
  final bool isFavorite;
  final ThemeData theme;
  const Product({
    super.key,
    required this.theme,
    required this.product,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5.0),
      onTap: () {
        Get.to(() => ProductDetailsScreen(productId: product.id!));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: SizedBox(
          width: 117,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: theme.primaryColor.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    topRight: Radius.circular(5.0),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.scaleDown,
                    image: NetworkImage(product.image ?? ''),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      product.title ?? '',
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          product.price!,
                          style: TextStyle(
                            fontSize: 13,
                            color: theme.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: <Widget>[
                            const Icon(
                              Icons.star,
                              size: 15,
                              color: Colors.amber,
                            ),
                            Text(
                              '${product.star ?? 0.0}',
                              style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            if (isFavorite == true) {
                              Get.find<WishListController>()
                                  .removeProductFromWishlist(product.id!);
                            } else {
                              Get.find<WishListController>()
                                  .addProductToWishlist(product.id!);
                            }
                          },
                          child: Card(
                            color: theme.primaryColor,
                            elevation: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Visibility(
                                visible: isFavorite == true,
                                replacement: const Icon(
                                  Icons.favorite_border,
                                  size: 16,
                                  color: Colors.white,
                                ),
                                child: const Icon(
                                  Icons.favorite,
                                  size: 16,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
