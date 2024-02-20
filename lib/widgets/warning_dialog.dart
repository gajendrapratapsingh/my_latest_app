import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/MyController.dart';
import 'package:myapp/theme/colors.dart';
import 'package:myapp/utils/PdfApi.dart';


class WarningDialog extends StatefulWidget {
  final String file;
  final String description;
  final bool allowDismissal;

  const WarningDialog({Key? key,
    required this.file,
    required this.description,
    required this.allowDismissal
  }) : super(key: key);

  @override
  State<WarningDialog> createState() => _WarningDialogState();
}

class _WarningDialogState extends State<WarningDialog> {
  double screenHeight = 0;
  double screenWidth = 0;

  @override
  void dispose() {
    if(!widget.allowDismissal) {
      print("EXIT APP");
      // SystemNavigator.pop(); this will close the app
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = Get.height;
    screenWidth = Get.width;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastLinearToSlowEaseIn,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: content(context),
      ),
    );
  }

  Widget content(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: screenHeight / 9,
          width: screenWidth / 1.4,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            color: AppColors.kAppBarColor,
          ),
          child: const Center(
            child: Icon(
              Icons.error_outline_outlined,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
        Container(
          height: screenHeight / 5.0,
          width: screenWidth / 1.4,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            color: Colors.white,
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Confirmation!!",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "My App",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        widget.description,
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      widget.allowDismissal ? Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 30,
                            width: 120,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.kAppBarColor,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Center(
                              child: Text(
                                "No",
                                style: TextStyle(
                                  color: AppColors.kAppBarColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ) : const SizedBox(),
                      SizedBox(width: widget.allowDismissal ? 16 : 0),
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            Get.find<MyController>().deletePdfFile(widget.file);
                            //PdfApi.deleteFile(widget.file);
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 30,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: AppColors.kAppBarColor,
                              boxShadow: const [
                                BoxShadow(
                                  color: AppColors.kAppBarColor,
                                  blurRadius: 10,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Text(
                                "Delete",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
