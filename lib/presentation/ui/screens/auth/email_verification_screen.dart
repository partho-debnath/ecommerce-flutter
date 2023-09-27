import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../state_holders/email_verification_controller.dart';
import '../../utility/image_assets.dart';
import 'otp_verification_screen.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
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
              top: 100,
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
                  'Welcome Back',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontSize: 35,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Please Enter Your E-mail Address',
                  style: theme.textTheme.displaySmall?.copyWith(
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <TextFormField>[
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email),
                          prefixIconColor: theme.primaryColor,
                          hintText: 'E-mail',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        validator: (String? email) {
                          if (email?.isEmpty ?? true) {
                            return 'Enter your email.';
                          } else if (email!.isEmail == false) {
                            return 'Please enter a valid email.';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                GetBuilder<EmailVerificationController>(
                  builder: (emailVerificationController) {
                    if (emailVerificationController
                        .emailVerificationInProgress) {
                      return const CircularProgressIndicator();
                    }
                    return ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate() == false) {
                          return;
                        }
                        verifyEmail(emailVerificationController);
                      },
                      child: const Text('Next'),
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

  Future<void> verifyEmail(
      EmailVerificationController emailVerificationController) async {
    final bool isVarified = await emailVerificationController
        .verifyEmail(emailController.text.trim());
    if (isVarified) {
      Get.to(() => OtpVerificationScreen(
            email: emailController.text.trim(),
            onPressResendOtp: () async {
              return await emailVerificationController
                  .verifyEmail(emailController.text.trim());
            },
          ));
    } else {
      Get.snackbar(
        'Warning!',
        'Email verification failed! Try again',
        backgroundColor: Colors.red.withOpacity(0.8),
      );
    }
  }
}
