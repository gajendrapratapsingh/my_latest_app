import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:myapp/common/app_bar.dart';
import 'package:myapp/controllers/MyController.dart';
import 'package:myapp/theme/colors.dart';
import 'package:myapp/utils/AppUtils.dart';
import 'package:myapp/utils/PdfApi.dart';
import 'package:myapp/widgets/button_widget.dart';
import 'package:myapp/widgets/warning_dialog.dart';


class MyView extends GetView<MyController> {
  const MyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "My App"),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                //   child: DropdownSearch<String>(
                //     popupProps: PopupProps.menu(
                //         showSelectedItems: true,
                //         //disabledItemFn: (String s) => s.startsWith('I'),
                //         showSearchBox: true,
                //         constraints: BoxConstraints(maxWidth: double.infinity, maxHeight: Get.height/2)
                //
                //     ),
                //     items: const ["Brazil", "Italia", "Tunisia", 'Canada', "India", "Pakistan", "SriLanka", "UK", "Bangladesh"],
                //     dropdownDecoratorProps: DropDownDecoratorProps(
                //       dropdownSearchDecoration: InputDecoration(
                //         labelText: "Country Name",
                //         hintText: "country in menu mode",
                //         contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                //         border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(10), // Define the border radius
                //         ),
                //       ),
                //     ),
                //     onChanged: print,
                //     selectedItem: "India",
                //   ),
                // ),
                // const SizedBox(height: 5.0),
                // const Text(
                //   'Count Value:',
                //   textAlign: TextAlign.center,
                // ),
                // Obx(() => Text(
                //   '${controller.count}',
                //   style: const TextStyle(fontSize: 24),
                //   textAlign: TextAlign.center,
                // )),
                // const SizedBox(height: 10.0),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   mainAxisSize: MainAxisSize.min,
                //   children: [
                //     GestureDetector(onTap: (){
                //       if(controller.tabEnabled.isTrue){
                //         if(controller.count == 0){
                //           controller.disableTab();
                //           AppUtils.showWarning(context, "Count value already is 0");
                //         }
                //         else{
                //           controller.decrement();
                //         }
                //       }
                //     }, child: Container(height: 45, width: 80, alignment: Alignment.center, decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(8.0)), child: Icon(FontAwesomeIcons.minus, color: Colors.white))),
                //     const SizedBox(width: 30),
                //     GestureDetector(onTap: (){controller.increment();}, child: Container(height: 45, width: 80, decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(8.0)), child: Icon(FontAwesomeIcons.plus, color: Colors.white)))
                //   ],
                // ),
                // const SizedBox(height: 10.0),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   mainAxisSize: MainAxisSize.min,
                //   children: [
                //     GestureDetector(onTap: () {
                //       controller.deletePdfFile(context, "Instance of 'Customer'_invoice_february.pdf");
                //     }, child: Container(height: 45, width: 80, alignment: Alignment.center, decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(8.0)), child: const Text("Delete", style: TextStyle(color: Colors.white, fontSize: 16)))),
                //     const SizedBox(width: 30),
                //     GestureDetector(onTap: (){controller.getPdfFile();}, child: Container(height: 45, width: 80, alignment: Alignment.center, decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(8.0)), child: const Text("Data", style: TextStyle(color: Colors.white, fontSize: 16))))
                //   ],
                // ),
                 Expanded(
                     child: GetBuilder<MyController>(
                       init: MyController(),
                       builder: (controller) {
                         return controller.fileList.isEmpty ? const Center(child: CircularProgressIndicator()) : GridView.builder(
                           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                                 color: Colors.white,
                                 shape: const RoundedRectangleBorder(
                                     borderRadius: BorderRadius.only(
                                         bottomRight: Radius.circular(10),
                                         topRight: Radius.circular(10)),
                                     side: BorderSide(width: 2, color: Colors.green)),
                                 child: Stack(
                                   alignment: Alignment.center,
                                   children: [
                                     InkWell(
                                       onTap: () {
                                         PdfApi.openFile(file);
                                       },
                                       child: Column(
                                         mainAxisAlignment: MainAxisAlignment.center,
                                         crossAxisAlignment: CrossAxisAlignment.center,
                                         children: [
                                           Image.asset('assets/images/pdf.png', height: 60, width: 60, fit: BoxFit.cover),
                                           Padding(
                                             padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                                             child: Text(file.path.split("/").last.split(".").first),
                                           ),
                                         ],
                                       ),
                                     ),
                                     Positioned(
                                         bottom: 0,
                                         right: 0,
                                         child: Padding(
                                           padding: const EdgeInsets.only(bottom: 2.0, right: 2.0),
                                           child: InkWell(
                                             onTap: (){
                                               Get.dialog(WarningDialog(description: "description", appLink: "appLink", allowDismissal: true));
                                             },
                                             child: Container(
                                               height: 32,
                                               width: 32,
                                               decoration: const BoxDecoration(
                                                 color: AppColors.kAppBarColor,
                                                 borderRadius: BorderRadius.only(
                                                   topLeft: Radius.circular(5.0),
                                                   bottomRight: Radius.circular(5.0)
                                                 ),
                                               ),
                                               child: const Icon(Icons.delete_rounded, color: Colors.white),
                                             ),
                                           ),
                                         )
                                     )
                                   ],
                                 ),
                               ),
                             );
                           },
                         );
                       },
                     ),
                 ),
              ],
            ),
            // Positioned(bottom: 10, child: ButtonWidget(
            //     text: 'Invoice PDF',
            //     onClicked: () async {
            //       controller.generatePdf(context);
            //     },
            //   )),
            Obx(() => controller.pdfGenerateState == PdfGenerateState.Busy ? const Center(child: SizedBox(height: 32, width: 32, child: CircularProgressIndicator(color: AppColors.kGreenColor, strokeWidth: 2.0))) : const SizedBox())
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: controller.increment,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
