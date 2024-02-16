import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:myapp/models/customer.dart';
import 'package:myapp/models/invoice.dart';
import 'package:myapp/models/supplier.dart';
import 'package:myapp/utils/AppUtils.dart';
import 'package:myapp/utils/PdfApi.dart';
import 'package:myapp/utils/pdf_invoice_api.dart';

enum PdfGenerateState {Idle, Busy, Finished, FinishedWithError}

class MyController extends GetxController {
  var count = 0.obs;

  var tabEnabled = true.obs;

  final _pdfGenerateState = PdfGenerateState.Idle.obs;
  PdfGenerateState get pdfGenerateState => _pdfGenerateState.value;


  void disableTab() {
    tabEnabled.value = false;
    Timer(const Duration(seconds: 2), () {
      tabEnabled.value = true;
    });
  }

  void increment() {
    count.value++;
  }

  void decrement() {
    count.value--;
  }


  void generatePdf(BuildContext context) async{
    _pdfGenerateState.value = PdfGenerateState.Busy;
    final date = DateTime.now();
    final dueDate = date.add(const Duration(days: 7));

    final invoice = Invoice(
      supplier: const Supplier(
        name: 'Sarah Field',
        address: 'Sarah Street 9, Beijing, China',
        paymentInfo: 'https://paypal.me/sarahfieldzz',
      ),
      customer: const Customer(
        name: 'Apple Inc.',
        address: 'Apple Street, Cupertino, CA 95014',
      ),
      info: InvoiceInfo(
        date: date,
        dueDate: dueDate,
        description: 'My description...',
        number: '${DateTime.now().year}-9999',
      ),
      items: [
        InvoiceItem(
          description: 'Coffee',
          date: DateTime.now(),
          quantity: 3,
          vat: 0.19,
          unitPrice: 5.99,
        ),
        InvoiceItem(
          description: 'Water',
          date: DateTime.now(),
          quantity: 8,
          vat: 0.19,
          unitPrice: 0.99,
        ),
        InvoiceItem(
          description: 'Orange',
          date: DateTime.now(),
          quantity: 3,
          vat: 0.19,
          unitPrice: 2.99,
        ),
        InvoiceItem(
          description: 'Apple',
          date: DateTime.now(),
          quantity: 8,
          vat: 0.19,
          unitPrice: 3.99,
        ),
        InvoiceItem(
          description: 'Mango',
          date: DateTime.now(),
          quantity: 1,
          vat: 0.19,
          unitPrice: 1.59,
        ),
        InvoiceItem(
          description: 'Blue Berries',
          date: DateTime.now(),
          quantity: 5,
          vat: 0.19,
          unitPrice: 0.99,
        ),
        InvoiceItem(
          description: 'Lemon',
          date: DateTime.now(),
          quantity: 4,
          vat: 0.19,
          unitPrice: 1.29,
        ),
        InvoiceItem(
          description: 'Blue Berries',
          date: DateTime.now(),
          quantity: 5,
          vat: 0.19,
          unitPrice: 0.99,
        ),
        InvoiceItem(
          description: 'Blue Berries',
          date: DateTime.now(),
          quantity: 5,
          vat: 0.19,
          unitPrice: 0.99,
        ),
      ],
    );

    final pdfFile = await PdfInvoiceApi.generate(invoice);

    PdfApi.openFile(pdfFile).then((pdfResult){
       if(pdfResult == "done"){
         _pdfGenerateState.value = PdfGenerateState.Finished;
       }
       else{
         _pdfGenerateState.value = PdfGenerateState.FinishedWithError;
         AppUtils.showWarning(context, pdfResult.message);
       }
    });
  }

}
