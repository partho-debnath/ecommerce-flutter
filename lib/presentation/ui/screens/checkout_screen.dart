import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/models/payment_method.dart';
import '../../state_holders/create_invoice_controller.dart';
import 'web_view_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<CreateInvoiceController>().createInvoice();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout Methods'),
      ),
      body: GetBuilder<CreateInvoiceController>(
        builder: (createInvoiceController) {
          if (createInvoiceController.getCategoryIsInProgress) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else {
            return ListView.separated(
              itemCount:
                  createInvoiceController.invoiceModel?.paymentMethod?.length ??
                      0,
              separatorBuilder: (cntxt, index) => const Divider(),
              itemBuilder: (cntxt, index) {
                final PaymentMethod paymentMethod =
                    createInvoiceController.invoiceModel!.paymentMethod![index];
                return ListTile(
                  onTap: () {
                    Get.off(() => WebViewScreen(
                        paymentUrl: paymentMethod.redirectGatewayURL!));
                  },
                  leading: Image.network(
                    paymentMethod.logo!,
                    width: 70,
                    fit: BoxFit.cover,
                  ),
                  title: Text(paymentMethod.name!),
                );
              },
            );
          }
        },
      ),
    );
  }
}
