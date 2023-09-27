import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../utility/image_assets.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lstNameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController shippingAddressController =
      TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lstNameController.dispose();
    mobileNumberController.dispose();
    cityController.dispose();
    shippingAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  ImageAssets.craftBayLogoSVG,
                  width: 100,
                ),
                const SizedBox(height: 16),
                Text(
                  'Complete Profile',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Get start with us with details',
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
                    children: <Widget>[
                      TextFormField(
                        controller: firstNameController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          prefixIconColor: theme.primaryColor,
                          hintText: 'First Name',
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        validator: (String? firstName) {
                          if (firstName?.isEmpty ?? true) {
                            return 'Please Enter Your First Name.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: lstNameController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          prefixIconColor: theme.primaryColor,
                          hintText: 'Last Name',
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        validator: (String? lastName) {
                          if (lastName?.isEmpty ?? true) {
                            return 'Please Enter Your Last Name.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: mobileNumberController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.phone),
                          prefixIconColor: theme.primaryColor,
                          hintText: 'Mobile',
                        ),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        validator: (String? mobileNo) {
                          if (mobileNo?.isEmpty ?? true) {
                            return 'Please Enter Your Mobile Number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: cityController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.location_city),
                          prefixIconColor: theme.primaryColor,
                          hintText: 'City',
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        validator: (String? city) {
                          if (city?.isEmpty ?? true) {
                            return 'Please Enter Your City Name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: shippingAddressController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.local_shipping),
                          prefixIconColor: theme.primaryColor,
                          hintText: 'Shipping Address',
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        maxLines: 3,
                        validator: (String? address) {
                          if (address?.isEmpty ?? true) {
                            return 'Please Enter Shipping Address';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() == false) {
                      return;
                    }
                    log('-----Ok------');
                  },
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
