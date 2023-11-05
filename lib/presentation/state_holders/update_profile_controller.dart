import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/models/user_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class ReadOrUpdateProfileController extends GetxController {
  UserModel? _user;
  bool _isGetOrUpdateProfileInProgress = false;
  bool get isGetOrUpdateProfileInProgress => _isGetOrUpdateProfileInProgress;
  UserModel? get user => _user;

  Future<bool> readProfile() async {
    _isGetOrUpdateProfileInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller().getRequest(
      Urls.readProfile,
      loginRequired: true,
    );
    _isGetOrUpdateProfileInProgress = false;
    update();
    if (response.isSuccess) {
      _user = UserModel.fromJson(response.responseJson!);
      update();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateProfile({
    required String cusName,
    required String cusAdd,
    required String cusCity,
    required String cusState,
    required String cusPostcode,
    required String cusCountry,
    required String cusPhone,
    required String cusFax,
    required String shipName,
    required String shipAdd,
    required String shipCity,
    required String shipState,
    required String shipPostcode,
    required String shipCountry,
    required String shipPhone,
  }) async {
    _isGetOrUpdateProfileInProgress = true;
    update();

    final Map<String, String> profileData = {
      'cus_name': cusName,
      'cus_add': cusAdd,
      'cus_city': cusCity,
      'cus_state': cusState,
      'cus_postcode': cusPostcode,
      'cus_country': cusCountry,
      'cus_phone': cusPhone,
      'cus_fax': cusFax,
      'ship_name': shipName,
      'ship_add': shipAdd,
      'ship_city': shipCity,
      'ship_state': shipState,
      'ship_postcode': shipPostcode,
      'ship_country': shipCountry,
      'ship_phone': shipPhone,
    };

    final NetworkResponse response = await NetworkCaller().postRequest(
      Urls.completeProfile,
      profileData,
      loginRequired: true,
    );
    _isGetOrUpdateProfileInProgress = false;
    update();
    if (response.isSuccess) {
      _user = UserModel.fromJson(response.responseJson!);
      update();
      return true;
    } else {
      return false;
    }
  }
}
