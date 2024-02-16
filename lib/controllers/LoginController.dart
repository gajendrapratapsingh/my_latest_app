import 'dart:core';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:myapp/api/ApiProvider.dart';
import 'package:myapp/utils/AppUtils.dart';
import 'package:myapp/utils/routes/routes.dart';

enum LoginState {Idle, Busy, Finished, NoData, FinishedWithError}

class LoginController extends GetxController {

  final ApiProvider _apiProvider = ApiProvider();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailFieldController = TextEditingController();
  final TextEditingController passwdFieldController = TextEditingController();


  final _isVisibile = true.obs;
  bool get isVisible => _isVisibile.value;
  void setVisibilty() => _isVisibile.value = !_isVisibile.value;


  final _loginState = LoginState.Idle.obs;
  LoginState get loginState => _loginState.value;

  Box? myAppBox;

  @override
  void onInit() {
    myAppBox = Hive.box("myAppBox");
    super.onInit();
  }

  @override
  void onClose() {
    emailFieldController.dispose();
    passwdFieldController.dispose();
    super.onClose();
  }

  void login(String username, String password, BuildContext context) async{
    _loginState.value = LoginState.Busy;
    var resp = _apiProvider.loginUser(username, password);
    resp.then((value){
      if(value == null){
        _loginState.value = LoginState.FinishedWithError;
        AppUtils.showWarning(context, "Wrong credentials!!");
      }
      else{
        print("login resp $value");
        myAppBox?.put('username', '${value['firstName']} ${value['lastName']}');
        myAppBox?.put('email', value['email']);
        myAppBox?.put('picture', value['image']);
        _loginState.value = LoginState.Finished;
        //Get.offAllNamed(Routes.userScreen,  arguments: {'username': '${value['firstName']} ${value['lastName']}', 'email' : value['email'], 'picture' : value['image']});
        Get.offAllNamed(Routes.userScreen);
      }
    });
  }
}
