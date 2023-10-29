import './invoice_create_data.dart';

class InvoiceCreateResponseModel {
  String? msg;
  List<InvoiceCreateData>? data;

  InvoiceCreateResponseModel({this.msg, this.data});

  InvoiceCreateResponseModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <InvoiceCreateData>[];
      json['data'].forEach((v) {
        data!.add(InvoiceCreateData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
