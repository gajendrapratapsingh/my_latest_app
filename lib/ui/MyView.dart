import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/common/app_bar.dart';
import 'package:myapp/controllers/MyController.dart';
import 'package:myapp/theme/colors.dart';
import 'package:myapp/utils/PdfApi.dart';
import 'package:myapp/widgets/invoice_dialog.dart';

import 'package:myapp/widgets/warning_dialog.dart';
import 'package:share_plus/share_plus.dart';

class MyView extends GetView<MyController> {
  const MyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My App")),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            Get.dialog(InvoiceDialog());
          },
          icon: Icon(Icons.add),
          label: Text('Create Invoice'),
          backgroundColor: AppColors.kAppBarColor,
          foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(child: Obx(() {
                  switch (controller.pdfDataState) {
                    case PdfDataState.Busy:return const Center(
                          child: CircularProgressIndicator(
                              color: AppColors.kAppBarColor));
                    case PdfDataState.Idle:return const Center(child: CircularProgressIndicator(color: AppColors.kAppBarColor));
                    case PdfDataState.Finished:return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 4.0,
                          crossAxisSpacing: 4.0,
                        ),
                        itemCount: controller.fileList.length,
                        itemBuilder: (context, index) {
                          File file = controller.fileList[index];
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Card(
                              elevation: 5,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  side: BorderSide(
                                      width: 2, color: Colors.green)),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      PdfApi.openFile(file);
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/images/pdf.png',
                                            height: 60,
                                            width: 60,
                                            fit: BoxFit.cover),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 5.0),
                                          child: Text(file.path.split("/").last.split(".").first),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 2.0, right: 2.0),
                                        child: InkWell(
                                          onTap: () {
                                            Get.dialog(WarningDialog(
                                                file: file.path.split("/").last,
                                                description:
                                                    "Do you want to delete ${file.path.split("/").last.split(".").first} invoice receipt.",
                                                allowDismissal: true));
                                          },
                                          child: Container(
                                            height: 32,
                                            width: 32,
                                            decoration: const BoxDecoration(
                                              color: AppColors.kAppBarColor,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5.0),
                                                  bottomRight: Radius.circular(5.0)),
                                            ),
                                            child: const Icon(
                                                Icons.delete_rounded,
                                                color: Colors.white),
                                          ),
                                        ),
                                      )),
                                  Positioned(
                                      bottom: 0,
                                      left: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 2.0, right: 2.0),
                                        child: InkWell(
                                          onTap: () async{
                                            print("File path ${file.path}");
                                            final result = Share.shareXFiles([XFile(file.path)], text: 'Invoice Pdf');
                                            //final result = await Share.shareXFiles([XFile('${file.path}')], text: 'Invoice Pdf');
                                            result.then((value) => print("Result ${value.status.toString()}"));

                                          },
                                          child: Container(
                                            height: 32,
                                            width: 32,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(5.0)),
                                            ),
                                            child: const Icon(
                                                Icons.share,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    case PdfDataState.FinishedWithError:return Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                            Image.asset('assets/images/no_data.png',
                                height: 80, width: 80, fit: BoxFit.cover),
                            const SizedBox(height: 5.0),
                            const Text("Data not found")
                          ]));
                    case PdfDataState.NoData: return Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/no_data.png',
                                  height: 80, width: 80, fit: BoxFit.cover),
                              const SizedBox(height: 5.0),
                              const Text("Data not found")
                            ]));
                  }
                }))
              ],
            ),
            Obx(() => controller.pdfGenerateState == PdfGenerateState.Busy
                ? const Center(child: SizedBox(height: 32, width: 32, child: CircularProgressIndicator(color: AppColors.kGreenColor, strokeWidth: 2.0)))
                : const SizedBox())
          ],
        ),
      ),
    );
  }
}
