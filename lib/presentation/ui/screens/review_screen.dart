import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../state_holders/review_controller.dart';
import './create_review_screen.dart';

class ReviewScreen extends StatefulWidget {
  final int productId;
  const ReviewScreen({super.key, required this.productId});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      log(widget.productId.toString());
      Get.find<ReviewController>().getReviews(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        leading: const BackButton(
          color: Colors.black54,
        ),
        title: const Text(
          'Reviews',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Get.find<ReviewController>().getReviews(widget.productId);
        },
        child: GetBuilder<ReviewController>(
          builder: (reviewController) {
            if (reviewController.getReviewIsInProgress) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (reviewController.reviewModel.data?.isEmpty ?? true) {
              return Center(
                child: Text(
                  'No reviews.',
                  style: theme.textTheme.displaySmall?.copyWith(fontSize: 20),
                ),
              );
            }
            return Column(
              children: <Widget>[
                Expanded(
                  child: ListView.separated(
                    itemCount: reviewController.reviewModel.data?.length ?? 0,
                    separatorBuilder: (cntxt, index) => const Divider(),
                    itemBuilder: (cntxt, index) {
                      return review(
                        reviewController
                                .reviewModel.data?[index].profile?.cusName ??
                            'Unknown',
                        reviewController.reviewModel.data?[index].description ??
                            '..',
                        reviewController.reviewModel.data?[index].rating ??
                            '0.0',
                        reviewController.reviewModel.data![index].updatedAt!,
                      );
                    },
                  ),
                ),
                Ink(
                  height: 60,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: theme.primaryColor.withOpacity(0.1),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Reviews (${reviewController.reviewModel.data?.length ?? 0})',
                      ),
                      FloatingActionButton(
                        backgroundColor: theme.primaryColor,
                        onPressed: () {
                          Get.to(() => CreateReviewScreen(
                                productId: widget.productId,
                              ))?.then((value) {
                            if (value == true) {
                              reviewController.getReviews(widget.productId);
                            }
                          });
                        },
                        child: const Icon(Icons.add),
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  ListTile review(String name, String review, String reviewRating,
      String reviewUpdatedTime) {
    return ListTile(
      leading: const CircleAvatar(child: Icon(Icons.person)),
      title: Text(name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 5),
          Text(
            review,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontSize: 16,
                  color: Colors.black87,
                ),
          ),
          const SizedBox(height: 5),
          Text(DateFormat.yMd().format(DateTime.parse(reviewUpdatedTime))),
        ],
      ),
      subtitleTextStyle: const TextStyle(
        fontSize: 14,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(reviewRating),
          const SizedBox(width: 10),
          Icon(reviewRating == '5' ? Icons.star : Icons.star_half,
              color: Colors.yellow),
        ],
      ),
    );
  }
}
