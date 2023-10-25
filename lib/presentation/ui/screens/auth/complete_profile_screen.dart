import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../state_holders/profile_controller.dart';
import '../../utility/image_assets.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController customerNameController = TextEditingController();
  final TextEditingController customerAddressController =
      TextEditingController();
  final TextEditingController customerCityController = TextEditingController();
  final TextEditingController customerStateController = TextEditingController();
  final TextEditingController customerPostCodeController =
      TextEditingController();
  final TextEditingController customerCountryController =
      TextEditingController();
  final TextEditingController customerPhoneController = TextEditingController();
  final TextEditingController customerFaxController = TextEditingController();
  final TextEditingController shipNameController = TextEditingController();
  final TextEditingController shipAddressController = TextEditingController();
  final TextEditingController shipCityController = TextEditingController();
  final TextEditingController shipStateController = TextEditingController();
  final TextEditingController shipPostCodeController = TextEditingController();
  final TextEditingController shipCountryController = TextEditingController();
  final TextEditingController shipPhoneController = TextEditingController();

  @override
  void dispose() {
    customerNameController.dispose();
    customerAddressController.dispose();
    customerCityController.dispose();
    customerStateController.dispose();
    customerPostCodeController.dispose();
    customerCountryController.dispose();
    customerPhoneController.dispose();
    customerFaxController.dispose();
    shipNameController.dispose();
    shipAddressController.dispose();
    shipCityController.dispose();
    shipStateController.dispose();
    shipPostCodeController.dispose();
    shipCountryController.dispose();
    shipPhoneController.dispose();

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
                        controller: customerNameController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          prefixIconColor: theme.primaryColor,
                          hintText: 'Your name',
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        validator: (String? customerName) {
                          if (customerName?.isEmpty ?? true) {
                            return 'Enter your name.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: customerStateController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.map),
                          prefixIconColor: theme.primaryColor,
                          hintText: 'Your state',
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        validator: (String? customerState) {
                          if (customerState?.isEmpty ?? true) {
                            return 'Enter youur state';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: customerCityController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.map),
                          prefixIconColor: theme.primaryColor,
                          hintText: 'Your City',
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        validator: (String? customerCity) {
                          if (customerCity?.isEmpty ?? true) {
                            return 'Enter your city name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: customerPostCodeController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.numbers),
                          prefixIconColor: theme.primaryColor,
                          hintText: 'Your post code',
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        validator: (String? customerPostCode) {
                          if (customerPostCode?.isEmpty ?? true) {
                            return 'Enter your post code';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: customerCountryController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.map_sharp),
                          prefixIconColor: theme.primaryColor,
                          hintText: 'Your country name',
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        validator: (String? customerCountryName) {
                          if (customerCountryName?.isEmpty ?? true) {
                            return 'Enter your country name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: customerAddressController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.location_city),
                          prefixIconColor: theme.primaryColor,
                          hintText: 'Your address',
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                        ),
                        maxLines: 3,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        validator: (String? customerAddress) {
                          if (customerAddress?.isEmpty ?? true) {
                            return 'Enter your address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: customerPhoneController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.phone),
                          prefixIconColor: theme.primaryColor,
                          hintText: 'Your phone number',
                        ),
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        maxLength: 15,
                        validator: (String? customerPhone) {
                          if (customerPhone?.isEmpty ?? true) {
                            return 'Enter your phone No.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: customerFaxController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.fax),
                          prefixIconColor: theme.primaryColor,
                          hintText: 'Your Fax',
                        ),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        validator: (String? customerFax) {
                          if (customerFax?.isEmpty ?? true) {
                            return 'Enter your Fax';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: shipNameController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          prefixIconColor: theme.primaryColor,
                          hintText: 'Shiping name',
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        validator: (String? shipingName) {
                          if (shipingName?.isEmpty ?? true) {
                            return 'Enter shiping name.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: shipStateController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.map),
                          prefixIconColor: theme.primaryColor,
                          hintText: 'Shiping state',
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        validator: (String? shipingState) {
                          if (shipingState?.isEmpty ?? true) {
                            return 'Enter shiping state';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: shipCityController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.map_sharp),
                          prefixIconColor: theme.primaryColor,
                          hintText: 'Shiping city name',
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        validator: (String? shipingCity) {
                          if (shipingCity?.isEmpty ?? true) {
                            return 'Shiping city name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: shipPostCodeController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.numbers),
                          prefixIconColor: theme.primaryColor,
                          hintText: 'Shiping post code',
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        validator: (String? shipingPostCode) {
                          if (shipingPostCode?.isEmpty ?? true) {
                            return 'Shiping post code';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: shipCountryController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.map_sharp),
                          prefixIconColor: theme.primaryColor,
                          hintText: 'Shiping country name',
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        validator: (String? shipingCountry) {
                          if (shipingCountry?.isEmpty ?? true) {
                            return 'Enter shiping country name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: shipPhoneController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.call),
                          prefixIconColor: theme.primaryColor,
                          hintText: 'Shiping phone',
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                        ),
                        maxLength: 15,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        validator: (String? shipingPhone) {
                          if (shipingPhone?.isEmpty ?? true) {
                            return 'Enter shiping phone no.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: shipAddressController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.location_city),
                          prefixIconColor: theme.primaryColor,
                          hintText: 'Shiping sddress',
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                        ),
                        maxLines: 3,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        validator: (String? shipingAddress) {
                          if (shipingAddress?.isEmpty ?? true) {
                            return 'Enter shiping address';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                GetBuilder<ProfileController>(
                  builder: (profileController) {
                    if (profileController.profileCreateInProgress == true) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }
                    return ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate() == false) {
                          return;
                        }
                        bool isProfileCreationSuccess =
                            await profileController.createProfile(
                          cusName: customerNameController.text.trim(),
                          cusAdd: customerAddressController.text.trim(),
                          cusCity: customerCityController.text.trim(),
                          cusCountry: customerCountryController.text.trim(),
                          cusFax: customerFaxController.text.trim(),
                          cusState: customerStateController.text.trim(),
                          cusPostcode: customerPostCodeController.text.trim(),
                          cusPhone: customerPhoneController.text.trim(),
                          shipName: shipNameController.text.trim(),
                          shipPostcode: shipPostCodeController.text.trim(),
                          shipCity: shipCityController.text.trim(),
                          shipCountry: shipCountryController.text.trim(),
                          shipState: shipStateController.text.trim(),
                          shipPhone: shipPhoneController.text.trim(),
                          shipAdd: shipAddressController.text.trim(),
                        );
                        if (isProfileCreationSuccess == true) {
                          _formKey.currentState!.reset();
                          Get.snackbar(
                            'Success!',
                            'Profile Created Successful.',
                            backgroundColor: Colors.green,
                          );
                        } else {
                          Get.snackbar(
                            'Failed!',
                            'Profile Created Failed. Try again.',
                            backgroundColor: Colors.red,
                          );
                        }
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
}
