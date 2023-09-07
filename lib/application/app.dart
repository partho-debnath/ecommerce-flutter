import 'package:flutter/material.dart';

import '../presentation/ui/screens/splash_screen.dart';
import '../presentation/ui/utility/app_colors.dart';

class CraftBay extends StatelessWidget {
  const CraftBay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CraftBay',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MaterialColor(
          AppColor.primaryColor.value,
          AppColor().color,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
