import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:myapp/common/app_bar.dart';
import 'package:myapp/controllers/MyController.dart';
import 'package:myapp/utils/AppUtils.dart';


class MyView extends GetView<MyController> {
  const MyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "My App"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
            child: DropdownSearch<String>(
              popupProps: PopupProps.menu(
                showSelectedItems: true,
                //disabledItemFn: (String s) => s.startsWith('I'),
                showSearchBox: true,
                constraints: BoxConstraints(maxWidth: double.infinity, maxHeight: Get.height/2)

              ),
              items: const ["Brazil", "Italia", "Tunisia", 'Canada', "India", "Pakistan", "SriLanka", "UK", "Bangladesh"],
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Country Name",
                  hintText: "country in menu mode",
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // Define the border radius
                  ),
                ),
              ),

              onChanged: print,
              selectedItem: "India",
            ),
          ),
          const SizedBox(height: 5.0),
          const Text(
            'Count Value:',
            textAlign: TextAlign.center,
          ),
          Obx(() => Text(
              '${controller.count}',
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            )),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(onTap: (){
                  if(controller.tabEnabled.isTrue){
                    if(controller.count == 0){
                      controller.disableTab();
                      AppUtils.showWarning(context, "Count value already is 0");
                    }
                    else{
                      controller.decrement();
                    }
                  }
                }, child: Container(height: 45, width: 80, alignment: Alignment.center, decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(8.0)), child: Icon(FontAwesomeIcons.minus, color: Colors.white))),
              const SizedBox(width: 30),
              GestureDetector(onTap: (){controller.increment();}, child: Container(height: 45, width: 80, decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(8.0)), child: Icon(FontAwesomeIcons.plus, color: Colors.white)))
            ],
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: controller.increment,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
