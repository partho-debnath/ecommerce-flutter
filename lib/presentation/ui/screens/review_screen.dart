import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './create_review_screen.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

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
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.separated(
              itemCount: 4,
              separatorBuilder: (cntxt, index) => const Divider(),
              itemBuilder: (cntxt, index) {
                return review();
              },
            ),
          ),
          Ink(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: theme.primaryColor.withOpacity(0.1),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'Reviews (04)',
                ),
                FloatingActionButton(
                  backgroundColor: theme.primaryColor,
                  onPressed: () {
                    Get.to(() => const CreateReviewScreen());
                  },
                  child: const Icon(Icons.add),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  ListTile review() {
    return const ListTile(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(Icons.person),
          SizedBox(width: 10),
          Text('Partho Debnath'),
        ],
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Text(
          '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type.''',
        ),
      ),
      subtitleTextStyle: TextStyle(
        fontSize: 14,
      ),
    );
  }
}
