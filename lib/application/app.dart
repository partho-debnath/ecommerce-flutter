import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../presentation/ui/screens/splash_screen.dart';
import '../presentation/ui/utility/app_colors.dart';
import './state_holder_binder.dart';

class CraftBay extends StatefulWidget {
  static final GlobalKey<NavigatorState> globalKey =
      GlobalKey<NavigatorState>();
  const CraftBay({super.key});

  @override
  State<CraftBay> createState() => _CraftBayState();
}

class _CraftBayState extends State<CraftBay> {
  late final StreamSubscription<ConnectivityResult>
      _connectivityResultSubscription;

  @override
  void initState() {
    super.initState();
    checkInternetConnectivity();
    checkInternetConnectivityStatus();
  }

  @override
  void dispose() {
    _connectivityResultSubscription.cancel();
    super.dispose();
  }

  Future<void> checkInternetConnectivity() async {
    final ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();
    handleConnectivityStates(connectivityResult);
  }

  void checkInternetConnectivityStatus() {
    // listen, when connection status is change
    _connectivityResultSubscription =
        Connectivity().onConnectivityChanged.listen((connectionResult) {
      handleConnectivityStates(connectionResult);
    });
  }

  void handleConnectivityStates(ConnectivityResult connectionResult) {
    if (connectionResult != ConnectivityResult.mobile &&
        connectionResult != ConnectivityResult.wifi) {
      Get.showSnackbar(const GetSnackBar(
        title: 'No internet!',
        message: 'Please check your internet connectivity.',
        isDismissible: false,
      ));
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeAllSnackbars();
      }
      Get.snackbar(
        'Connected to internet!',
        'You are online.',
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: CraftBay.globalKey,
      initialBinding: StateHolderBinder(),
      title: 'CraftBay',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: MaterialColor(
          AppColor.primaryColor.value,
          AppColor().color,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            minimumSize: const Size.fromHeight(40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: MaterialColor(
          AppColor.primaryColor.value,
          AppColor().color,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            minimumSize: const Size.fromHeight(40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      themeMode: ThemeMode.light,
      home: const SplashScreen(),
    );
  }
}
