import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/controller/auth_controller.dart';
import 'package:restaurant_app/helper/helper_function.dart';
import 'package:restaurant_app/pages/home/home_page.dart';
import 'package:restaurant_app/repository/auth_repo.dart';
import 'package:restaurant_app/routes/route_helper.dart';
import 'package:restaurant_app/widget/app_logo.dart';
import 'package:restaurant_app/widget/app_text_field.dart';
import 'package:restaurant_app/widget/colors.dart';
import 'package:restaurant_app/widget/custom_loader.dart';
import 'package:restaurant_app/widget/dimensions.dart';
import 'package:restaurant_app/widget/go_to_initial_page_button.dart';
import 'package:restaurant_app/widget/widgets.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isLoading = false;
  final formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  AuthRepo authRepo = AuthRepo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthController>(builder: (_authController){
        return !_authController.isLoading
            ? Container(
        height: double.infinity,
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor))
            : SingleChildScrollView(
          child: Padding(
            padding:
            EdgeInsets.symmetric(horizontal: Dimensions.width20,
                vertical: Dimensions.height30 * 2),
            child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const GoToInitialPageIcon(),
                    SizedBox(
                        height: Dimensions.height10 * 5),
                    const AppLogo(),
                    SizedBox(
                      // height: Dimensions.height10 * 5,
                      child: AppTextField(
                        icon: Icons.person,
                        labelText: "نام و نام خانوادگی",
                        isObscure: false,
                        error: "لطفا قسمت نام و نام خانوادگی را تکمیل نمایید.",
                        controller: nameController,
                      ),
                      // Directionality(
                      //   textDirection: TextDirection.rtl,
                      //   child:
                      //   TextFormField(
                      //     decoration: textInputDecoration.copyWith(
                      //         labelText: "نام و نام خانوادگی",
                      //         prefixIcon: Icon(
                      //           Icons.person,
                      //           color: Theme.of(context).primaryColor,
                      //         )),
                      //     onChanged: (val) {
                      //       setState(() {
                      //         fullName = val;
                      //       });
                      //     },
                      //     validator: (val) {
                      //       if (val!.isNotEmpty) {
                      //         return null;
                      //       } else {
                      //         return "لطفا قسمت نام و نام خانوادگی را تکمیل نمایید.";
                      //       }
                      //     },
                      //   ),
                      // ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      // height: Dimensions.height10 * 5,
                      child: AppTextField(
                        icon: Icons.email,
                        labelText: "ایمیل",
                        isObscure: false,
                        error: "لطفاایمیل خود را به ظور صحیح وارد تمایید.",
                        controller: emailController,
                      ),
                      // Directionality(
                      //   textDirection: TextDirection.rtl,
                      //   child: TextFormField(
                      //     decoration: textInputDecoration.copyWith(
                      //         labelText: "ایمیل",
                      //         prefixIcon: Icon(
                      //           Icons.email,
                      //           color: Theme.of(context).primaryColor,
                      //         )),
                      //     onChanged: (val) {
                      //       setState(() {
                      //         email = val;
                      //       });
                      //     },
                      //     // check tha validation
                      //     validator: (val) {
                      //       return RegExp(
                      //           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      //           .hasMatch(val!)
                      //           ? null
                      //           : "لطفا فرم درست ایمیل خود را وارد تمایید.";
                      //     },
                      //   ),
                      // ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      // height: Dimensions.height10 * 5,
                      child: AppTextField(
                        icon: Icons.lock,
                        labelText: "رمز عبور",
                        isObscure: true,
                        error: "رمز عبور نباید کنتر از 6 کاراکتر باشد.",
                        controller: passwordController,
                      ),
                      // Directionality(
                      //   textDirection: TextDirection.rtl,
                      //   child: TextFormField(
                      //     obscureText: true,
                      //     decoration: textInputDecoration.copyWith(
                      //         labelText: "رمز عبور",
                      //         prefixIcon: Icon(
                      //           Icons.lock,
                      //           color: Theme.of(context).primaryColor,
                      //         )),
                      //     validator: (val) {
                      //       if (val!.length < 6) {
                      //         return "رمز عبور نباید کنتر از 6 کاراکتر باشد.";
                      //       } else {
                      //         return null;
                      //       }
                      //     },
                      //     onChanged: (val) {
                      //       setState(() {
                      //         password = val;
                      //       });
                      //     },
                      //   ),
                      // ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // AppButton(
                    //   formKey: formKey,
                    //   email: email,
                    //   password: password,
                    //   fullName: fullName,
                    //   authController: _authController,
                    //   buttonName: "ثبت نام",
                    // ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        child: const Text(
                          "ثبت نام",
                          style:
                          TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        onPressed: () {
                          // _authController.registration(fullName, email, password);
                          var fullName = nameController.text;
                          var email = emailController.text;
                          var password = passwordController.text;

                          _registration(_authController, fullName, email, password);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text.rich(TextSpan(
                      text: "آیا شما قبلا اکانت ساخته اید؟ ",
                      style: TextStyle(
                          color: Colors.black, fontSize: Dimensions.font16 * 0.8),
                      children: <TextSpan>[
                        TextSpan(
                            text: "ورود",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.offNamed(RouteHelper.getLoginPage());
                              }),
                      ],
                    )),
                  ],
                )),
          ),
        ),
      )
            : const CustomLoader();}
      )
    );
  }

  _registration(AuthController authController, String fullName, String email, String password ) async{
    if (formKey.currentState!.validate()) {
       await authController.registration(fullName, email, password);
    }
  }
}
