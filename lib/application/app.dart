import 'package:flutter/material.dart';

class CraftBay extends StatelessWidget {
  const CraftBay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'app title',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('data'),
        ),
      ),
    );
  }
}
