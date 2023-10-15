import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../application/app.dart';
import '../../presentation/state_holders/auth_controller.dart';
import '../../presentation/ui/screens/auth/email_verification_screen.dart';
import '../models/network_response.dart';

class NetworkCaller {
  Future<NetworkResponse> getRequest(
    String url, {
    bool loginRequired = false,
    String tempToken = '',
  }) async {
    final String token = AuthController.accessToken ?? tempToken;
    try {
      log(token);
      Response response = await get(
        Uri.parse(url),
        headers: {
          'token': token,
        },
      );
      log(response.statusCode.toString());
      // log(response.body);
      if (response.statusCode == 200 &&
          jsonDecode(response.body)['msg'] == 'success') {
        return NetworkResponse(
            true, response.statusCode, jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        if (loginRequired) {
          gotoLogin();
        }
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }

  Future<NetworkResponse> postRequest(
    String url,
    Map<String, dynamic> body, {
    bool loginRequired = false,
    String tempToken = '',
  }) async {
    try {
      Response response = await post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'token': AuthController.accessToken ?? tempToken,
        },
        body: jsonEncode(body),
      );
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200) {
        return NetworkResponse(
          true,
          response.statusCode,
          jsonDecode(response.body),
        );
      } else if (response.statusCode == 401) {
        if (loginRequired == true) {
          gotoLogin();
        }
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }

  Future<void> gotoLogin() async {
    await AuthController.clearUserInfo();
    Navigator.pushAndRemoveUntil(
        CraftBay.globalKey.currentContext!,
        MaterialPageRoute(
            builder: (context) => const EmailVerificationScreen()),
        (route) => false);
  }
}
