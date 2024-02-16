import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myapp/common/spacing.dart';
import 'package:myapp/controllers/LoginController.dart';
import 'package:myapp/theme/colors.dart';
import 'package:myapp/theme/text_theme.dart';
import 'package:myapp/ui/auth/screens/register_screen.dart';
import 'package:myapp/ui/auth/widgets/custom_button.dart';
import 'package:myapp/ui/auth/widgets/custom_text_field.dart';
import 'package:myapp/utils/AppUtils.dart';
import 'package:myapp/utils/routes/routes.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final LoginController _loginController = Get.find<LoginController>();
  //ApiCall apiCall = ApiCall();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/logo.jpg',
                            height: 250.h,
                          ),
                        ),
                      ),
                      heightSpacer(10.h),
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Login to your account',
                          style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      heightSpacer(25.h),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text('Email', style: AppTextTheme.kLabelStyle),
                      ),
                      CustomTextField(
                        controller: email,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email is required';
                          }
                          // else if (!emailRegex.hasMatch(value)) {
                          //   return 'Invalid email address';
                          // }
                          return null;
                        },
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xFFD1D8FF)),
                            borderRadius: BorderRadius.circular(14)),
                        inputHint: "Enter your email",
                      ),
                      heightSpacer(20),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text('Password', style: AppTextTheme.kLabelStyle),
                      ),
                      Obx(() =>  CustomTextField(
                        controller: password,
                        obscureText: _loginController.isVisible,
                        cursorColor: AppColors.kGreenColor,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                        suffixIcon: IconButton(onPressed: (){
                          _loginController.setVisibilty();
                        }, icon: _loginController.isVisible ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xFFD1D8FF)),
                            borderRadius: BorderRadius.circular(14)),
                        inputHint: "Password",
                      )),
                      heightSpacer(30),
                      CustomButton(
                        buttonText: "Login",
                        press: () async {
                          if(_formKey.currentState!.validate()) {
                            _loginController.login(email.text.trim(), password.text.trim(), context);
                          }
                          else{
                            AppUtils.showWarning(context, "All field is reqired!!");
                          }
                        },
                      ),
                      heightSpacer(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Didn’t have an account?",
                            style: AppTextTheme.kLabelStyle.copyWith(
                              color: AppColors.kGreyDk,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(Routes.registerScreen);
                            },
                            child: Text(
                              " Register",
                              style: AppTextTheme.kLabelStyle.copyWith(
                                color: AppColors.kGreenColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Obx(() => _loginController.loginState == LoginState.Busy ? const Center(child: CircularProgressIndicator(color: AppColors.kGreenColor, strokeWidth: 2.0)) : const SizedBox())
          ],
        ),
      ),
    );
  }
}