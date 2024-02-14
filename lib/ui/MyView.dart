import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/MyController.dart';


class MyView extends GetView<MyController> {
  const MyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white), // Change the icon here
          onPressed: () {
            // Add your back button logic here
            //Navigator.pop(context);
            Get.back();
          },
        ),
      ),
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
              items: const ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada', "India", "Pakistan", "SriLanka", "UK", "Bangladesh"],
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
            'You have pushed the button this many times:',
            textAlign: TextAlign.center,
          ),
          Obx(() => Text(
              '${controller.count}',
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}