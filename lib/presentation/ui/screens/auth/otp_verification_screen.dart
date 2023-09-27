import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../state_holders/otp_verification_controller.dart';
import '../../utility/image_assets.dart';
import './complete_profile_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String email;
  final Future<bool> Function() onPressResendOtp;
  const OtpVerificationScreen({
    super.key,
    required this.email,
    required this.onPressResendOtp,
  });

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();
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
    otpController.dispose();
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
                    controller: otpController,
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
                GetBuilder<OtpVerificationController>(
                  builder: (otpVerificationController) {
                    if (otpVerificationController.otpVerificationInProgress ==
                        true) {
                      return const CircularProgressIndicator();
                    }
                    return ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate() == false) {
                          return;
                        } else {
                          verifyOtp(otpVerificationController);
                        }
                      },
                      child: const Text('Next'),
                    );
                  },
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
                          onPressed: () async {
                            if (second == _timerLimitInSeconds) {
                              setTimer();
                              await resendOtp();
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

  Future<void> resendOtp() async {
    bool isResendOtp = await widget.onPressResendOtp();
    if (isResendOtp) {
      Get.snackbar(
        'Success',
        'OTP Sent to this ${widget.email} email.',
        backgroundColor: Colors.green,
      );
    }
  }

  Future<void> verifyOtp(
      OtpVerificationController otpVerificationController) async {
    final bool isVarified = await otpVerificationController.verifyOtp(
      email: widget.email,
      otp: otpController.text.trim(),
    );

    if (isVarified) {
      Get.to(() => const CompleteProfileScreen());
    } else {
      Get.snackbar(
        'Warning!',
        'Wrong OTP.',
        backgroundColor: Colors.red.withOpacity(0.8),
      );
    }
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
