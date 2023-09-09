import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../utility/image_assets.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  late Timer _timer;
  final int _timerLimitInSeconds = 120;
  late int _seconds;

  @override
  void initState() {
    super.initState();
    setTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 80,
              left: 16,
              right: 16,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  ImageAssets.craftBayLogoSVG,
                  width: 100,
                ),
                const SizedBox(height: 16),
                Text(
                  'Enter OTP Code',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontSize: 35,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'A 4 Digit OTP Code has been Sent',
                  style: theme.textTheme.displaySmall?.copyWith(
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                PinCodeTextField(
                  appContext: context,
                  length: 4,
                  obscureText: false,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    selectedFillColor: Colors.white,
                    selectedColor: Colors.green,
                    activeFillColor: Colors.white,
                    activeColor: Theme.of(context).primaryColor,
                    inactiveFillColor: Colors.white,
                    inactiveColor: Theme.of(context).primaryColor,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  keyboardType: TextInputType.number,
                  onCompleted: (v) {
                    log("Completed");
                  },
                  onChanged: (value) {
                    log('on $value');
                  },
                  beforeTextPaste: (text) {
                    log("Allowing to paste $text");
                    return true;
                  },
                  validator: (String? otp) {
                    if (otp?.isEmpty ?? true) {
                      return 'Enter The OTP.';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Next'),
                ),
                const SizedBox(
                  height: 24,
                ),
                RichText(
                  text: TextSpan(
                    style: theme.textTheme.displaySmall?.copyWith(
                      fontSize: 17,
                    ),
                    children: <TextSpan>[
                      const TextSpan(text: 'This code will expired in '),
                      TextSpan(
                        style: TextStyle(
                          color: theme.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        text: '${_seconds}s',
                      ),
                    ],
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: _seconds == _timerLimitInSeconds
                        ? theme.primaryColor
                        : Colors.grey,
                  ),
                  onPressed: () {
                    if (_seconds == _timerLimitInSeconds) {
                      setTimer();
                    }
                  },
                  child: const Text('Resend Code'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setTimer() {
    _seconds = _timerLimitInSeconds;
    if (mounted) {
      setState(() {});
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds == 0) {
        timer.cancel();
        _seconds = _timerLimitInSeconds;
      } else {
        _seconds -= 1;
      }
      if (mounted) {
        setState(() {});
      }
    });
  }
}
