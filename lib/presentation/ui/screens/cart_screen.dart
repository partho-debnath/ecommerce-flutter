import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../state_holders/cart_controller.dart';
import '../../state_holders/main_bottom_nav_controller.dart';
import '../widgets/product_cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<CartController>().getCart();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return WillPopScope(
      onWillPop: () async {
        Get.find<MainBottomNavController>().backToHomeScreen();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: const BackButton(color: Colors.black54),
          title: const Text(
            'Cart',
            style: TextStyle(color: Colors.black54),
          ),
        ),
        body: GetBuilder<CartController>(
          builder: (cartController) {
            if (cartController.getCartIsInProgress) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
            return Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (xntxt, index) {
                      return ProductCartItem(theme: theme);
                    },
                  ),
                ),
                productCheckout(theme),
              ],
            );
          },
        ),
      ),
    );
  }

  Container productCheckout(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(10.0),
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
                'Total Price',
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
            width: 140,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Checkout'),
            ),
          ),
        ],
      ),
    );
  }
}
