import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/MyController.dart';
import 'package:myapp/theme/colors.dart';
import 'package:myapp/utils/AppUtils.dart';

class InvoiceDialog extends StatefulWidget {
  const InvoiceDialog({super.key});

  @override
  State<InvoiceDialog> createState() => _InvoiceDialogState();
}

class _InvoiceDialogState extends State<InvoiceDialog> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController customernameController = TextEditingController();
  TextEditingController customeraddressController = TextEditingController();

  @override
  void dispose() {
    customernameController.dispose();
    customeraddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     return Container(
       height: Get.height,
       width: Get.width,
       child: AlertDialog(
        title: Text('Invoice'),
        content: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // TextFormField(
              //   controller: customernameController,
              //   decoration: InputDecoration(
              //     labelText: "Customer Name",
              //     prefixIcon: Icon(Icons.person),
              //     contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10.0),
              //       borderSide: BorderSide(color: Colors.grey),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10.0),
              //       borderSide: BorderSide(color: Colors.indigo.shade700),
              //     ),
              //     errorBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10.0),
              //       borderSide: BorderSide(color: Colors.red),
              //     ),
              //     focusedErrorBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10.0),
              //       borderSide: BorderSide(color: Colors.red),
              //     ),
              //   ),
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return 'Customer name is required';
              //     }
              //     return null;
              //   },
              // ),
              // SizedBox(height: 10),
              // TextFormField(
              //   controller: customeraddressController,
              //   textAlignVertical: TextAlignVertical.top,
              //   decoration: InputDecoration(
              //     labelText: "Customer Address",
              //     prefixIcon: Icon(Icons.location_city),
              //     contentPadding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10.0),
              //       borderSide: BorderSide(color: Colors.grey),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10.0),
              //       borderSide: BorderSide(color: Colors.indigo.shade700),
              //     ),
              //     errorBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10.0),
              //       borderSide: BorderSide(color: Colors.red),
              //     ),
              //     focusedErrorBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10.0),
              //       borderSide: BorderSide(color: Colors.red),
              //     ),
              //     alignLabelWithHint: true,
              //     isCollapsed: true,
              //   ),
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return 'Customer address is required';
              //     }
              //     return null;
              //   },
              // ),
              // SizedBox(height: 10),
              // DropdownSearch(
              //   //autoValidateMode: AutovalidateMode.onUserInteraction,
              //   items: ["Selected Product", "Sugar", "Rice", "Oil", "Refine", "Dal", "Masala", "Paneer", "Milk"],
              //   popupProps: PopupProps.menu(
              //     showSelectedItems: true,
              //     title: Text("Product Name"),
              //     disabledItemFn: (String s) => s.startsWith('M'),
              //     showSearchBox: true
              //   ),
              //   onChanged: (value) {
              //     // Handle the selected address here
              //   },
              //   validator: (String? item) {
              //     if(item == null)
              //       return "Required field";
              //     else if (item == "Selected Product")
              //       return "Invalid item";
              //     else
              //       return null;
              //   },
              // ),
              // SizedBox(height: 10),
              DropdownSearch(
                //autoValidateMode: AutovalidateMode.onUserInteraction,
                items: ["Selected Product", "Sugar", "Rice", "Oil", "Refine", "Dal", "Masala", "Paneer", "Milk"],
                popupProps: PopupProps.menu(
                    showSelectedItems: true,
                    title: Text("Product Quantity"),
                    disabledItemFn: (String s) => s.startsWith('M'),
                    showSearchBox: true
                ),
                onChanged: (value) {
                  // Handle the selected address here
                },
                validator: (String? item) {
                  if(item == null)
                    return "Required field";
                  else if (item == "Selected Product")
                    return "Invalid item";
                  else
                    return null;
                },
              ),
              SizedBox(height: 10),
              DropdownSearch(
                //autoValidateMode: AutovalidateMode.onUserInteraction,
                items: ["Selected Quantity", "1 KG", "Rice", "Oil", "Refine", "Dal", "Masala", "Paneer", "Milk"],
                popupProps: PopupProps.menu(
                    showSelectedItems: true,
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Product Quantity"),
                    ),
                    disabledItemFn: (String s) => s.startsWith('M'),
                    showSearchBox: true
                ),
                onChanged: (value) {
                  // Handle the selected address here
                },
                validator: (String? item) {
                  if(item == null)
                    return "Required field";
                  else if (item == "Selected Product")
                    return "Invalid item";
                  else
                    return null;
                },
              ),
              SizedBox(height: 10),
              Table(children: [],)
            ],
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                    ),
                    backgroundColor: Colors.red
                ),
                child: Text('Cancel', style: TextStyle(color: Colors.white)),
              ),
              ElevatedButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()) {
                    Get.find<MyController>().generatePdf(customernameController.text.trim(), customeraddressController.text.trim());
                    Get.back();
                  }
                  else{
                    AppUtils.showWarning(context, "All fields is reqired!!");
                  }

                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                    ),
                    backgroundColor: AppColors.kAppBarColor
                ),
                child: Text('Submit', style: TextStyle(color: Colors.white)),
              ),
            ],
          )

        ],
           ),
     );
  }
}
