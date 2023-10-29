import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../data/models/cart_data.dart';
import './stepper_counter.dart';

class ProductCartItem extends StatelessWidget {
  final ThemeData theme;
  final CartData cartData;
  final VoidCallback onDelete;
  final void Function(int cartId, int quantity) onChangeProductQuantity;

  const ProductCartItem({
    super.key,
    required this.theme,
    required this.cartData,
    required this.onDelete,
    required this.onChangeProductQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            height: 100,
            width: 100,
            child: Image.network(cartData.product!.image!),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            cartData.product!.title!,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                              children: <TextSpan>[
                                TextSpan(text: 'Color: ${cartData.color}, '),
                                TextSpan(text: 'Size: ${cartData.size}'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        log(cartData.productId.toString());
                        onDelete();
                      },
                      icon: const Icon(Icons.delete_outline),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '\$${cartData.price}',
                      style: TextStyle(
                        color: theme.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 78,
                      child: FittedBox(
                        child: StepperCounter(
                          color: theme.primaryColor,
                          lowerLimit: 1,
                          upperLimit: 10,
                          startingValue: cartData.quantity ?? 1,
                          stepValue: 1,
                          onChange: (quantity) {
                            onChangeProductQuantity(
                                cartData.productId!, quantity);
                          },
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
