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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late ValueNotifier<int> _remainingTimeInSeconds;
  late Timer _timer;
  final int _timerLimitInSeconds = 120;

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
                Form(
                  key: _formKey,
                  child: PinCodeTextField(
                    appContext: context,
                    length: 4,
                    autoDisposeControllers: false,
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
                        return 'Enter The OTP Code.';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      log('ok');
                    } else {
                      log('Not Ok');
                    }
                  },
                  child: const Text('Next'),
                ),
                const SizedBox(
                  height: 24,
                ),
                ValueListenableBuilder(
                  valueListenable: _remainingTimeInSeconds,
                  builder: (cntxt, second, child) {
                    return Column(
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            style: theme.textTheme.displaySmall?.copyWith(
                              fontSize: 17,
                            ),
                            children: <TextSpan>[
                              const TextSpan(
                                  text: 'This code will expired in '),
                              TextSpan(
                                style: TextStyle(
                                  color: theme.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                                text: '${second}s',
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: second == _timerLimitInSeconds
                                ? theme.primaryColor
                                : Colors.grey,
                          ),
                          onPressed: () {
                            if (second == _timerLimitInSeconds) {
                              setTimer();
                            }
                          },
                          child: const Text('Resend Code'),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setTimer() {
    _remainingTimeInSeconds = ValueNotifier(_timerLimitInSeconds);
    setState(() {});
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTimeInSeconds.value == 0) {
        timer.cancel();
        _remainingTimeInSeconds.value = _timerLimitInSeconds;
      } else {
        _remainingTimeInSeconds.value -= 1;
      }
    });
  }
}
