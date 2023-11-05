import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../state_holders/update_profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ReadOrUpdateProfileController readOrUpdateProfileController =
      Get.find<ReadOrUpdateProfileController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController customerNameController;
  late TextEditingController customerAddressController =
      TextEditingController();
  late TextEditingController customerCityController;
  late TextEditingController customerStateController;
  late TextEditingController customerPostCodeController =
      TextEditingController();
  late TextEditingController customerCountryController =
      TextEditingController();
  late TextEditingController customerPhoneController;
  late TextEditingController customerFaxController;
  late TextEditingController shipNameController;
  late TextEditingController shipAddressController;
  late TextEditingController shipCityController;
  late TextEditingController shipStateController;
  late TextEditingController shipPostCodeController;
  late TextEditingController shipCountryController;
  late TextEditingController shipPhoneController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await readOrUpdateProfileController.readProfile();
    });
    customerNameController = TextEditingController(
        text: readOrUpdateProfileController.user?.data?.cusName ?? '');
    customerAddressController = TextEditingController(
        text: readOrUpdateProfileController.user?.data?.cusAdd ?? '');
    customerCityController = TextEditingController(
        text: readOrUpdateProfileController.user?.data?.cusCity ?? '');
    customerStateController = TextEditingController(
        text: readOrUpdateProfileController.user?.data?.cusState ?? '');
    customerPostCodeController = TextEditingController(
        text: readOrUpdateProfileController.user?.data?.cusPostcode ?? '');
    customerCountryController = TextEditingController(
        text: readOrUpdateProfileController.user?.data?.cusCountry ?? '');
    customerPhoneController = TextEditingController(
        text: readOrUpdateProfileController.user?.data?.cusPhone ?? '');
    customerFaxController = TextEditingController(
        text: readOrUpdateProfileController.user?.data?.cusFax ?? '');
    shipNameController = TextEditingController(
        text: readOrUpdateProfileController.user?.data?.shipName ?? '');
    shipAddressController = TextEditingController(
        text: readOrUpdateProfileController.user?.data?.shipAdd ?? '');
    shipCityController = TextEditingController(
        text: readOrUpdateProfileController.user?.data?.shipCity ?? '');
    shipStateController = TextEditingController(
        text: readOrUpdateProfileController.user?.data?.shipState ?? '');
    shipPostCodeController = TextEditingController(
        text: readOrUpdateProfileController.user?.data?.shipPostcode ?? '');
    shipCountryController = TextEditingController(
        text: readOrUpdateProfileController.user?.data?.shipCountry ?? '');
    shipPhoneController = TextEditingController(
        text: readOrUpdateProfileController.user?.data?.shipPhone ?? '');
  }

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
      appBar: AppBar(
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.transparent,
        title: GetBuilder<ReadOrUpdateProfileController>(
          builder: (cn) => Text(
            readOrUpdateProfileController.user?.data?.cusName ?? 'Profile',
            style: const TextStyle(color: Colors.black54),
          ),
        ),
      ),
      body: SafeArea(
        child: GetBuilder<ReadOrUpdateProfileController>(
          builder: (readOrUpdateProfileController) {
            if (readOrUpdateProfileController.isGetOrUpdateProfileInProgress) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const CircleAvatar(
                      foregroundColor: Colors.transparent,
                      radius: 50,
                      child: Icon(
                        Icons.person_outlined,
                        size: 50,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16),
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
                          Text(
                            'Shipping Details',
                            style: theme.textTheme.displayMedium?.copyWith(
                              fontSize: 30,
                            ),
                          ),
                          const SizedBox(height: 24),
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
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate() == false) {
                          return;
                        }
                        bool isProfileUpdateSuccess =
                            await readOrUpdateProfileController.updateProfile(
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
                        if (isProfileUpdateSuccess == true) {
                          Get.snackbar(
                            'Success!',
                            'Profile update Successful.',
                            backgroundColor: Colors.green,
                          );
                        } else {
                          Get.snackbar(
                            'Failed!',
                            'Profile update Failed. Try again.',
                            backgroundColor: Colors.red,
                          );
                        }
                      },
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
