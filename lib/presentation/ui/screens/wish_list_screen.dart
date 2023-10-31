import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/models/product_data.dart';
import '../../state_holders/main_bottom_nav_controller.dart';
import '../../state_holders/wish_list_controller.dart';
import '../widgets/product.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<WishListController>().getWishList();
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
          elevation: 2,
          leading: const BackButton(color: Colors.black54),
          title: const Text(
            'Wishlist',
            style: TextStyle(color: Colors.black54),
          ),
        ),
        body: GetBuilder<WishListController>(
          builder: (wishListController) {
            if (wishListController.getWishListIsInProgress) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (wishListController.wishListModel.data?.isEmpty ?? true) {
              return Center(
                child: Text(
                  'Empty wishlist.',
                  style: theme.textTheme.displaySmall?.copyWith(fontSize: 25),
                ),
              );
            }
            return GridView.builder(
              padding: const EdgeInsets.all(5.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 2.3 / 3,
              ),
              itemCount: wishListController.wishListModel.data?.length ?? 0,
              itemBuilder: (cntxt, index) {
                final ProductData productData =
                    wishListController.wishListModel.data![index].product!;
                return FittedBox(
                  child: Product(
                    product: productData,
                    isFavorite: true,
                    theme: theme,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
