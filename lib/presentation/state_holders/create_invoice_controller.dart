import 'package:get/get.dart';

import '../../data/models/invoice_create_data.dart';
import '../../data/models/invoice_create_response_model.dart';
import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class CreateInvoiceController extends GetxController {
  bool _getInvoiceListInProgress = false;
  String _errorMessage = '';
  InvoiceCreateResponseModel _invoiceModel = InvoiceCreateResponseModel();

  bool get getCategoryIsInProgress => _getInvoiceListInProgress;
  String get errorMessage => _errorMessage;
  InvoiceCreateData? get invoiceModel => _invoiceModel.data?.first;

  Future<bool> createInvoice() async {
    late bool isSuccess;
    _getInvoiceListInProgress = true;
    update();

    final NetworkResponse networkResponse = await NetworkCaller().getRequest(
      Urls.createInvoice,
      loginRequired: true,
    );
    _getInvoiceListInProgress = false;
    update();

    if (networkResponse.isSuccess) {
      _invoiceModel = InvoiceCreateResponseModel.fromJson(
          networkResponse.responseJson ?? {});
      isSuccess = true;
    } else {
      _errorMessage = 'Invoice create failed!';
      isSuccess = false;
    }

    update();
    return isSuccess;
  }
}
