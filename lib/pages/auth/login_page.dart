import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/controller/auth_controller.dart';
import 'package:restaurant_app/repository/auth_repo.dart';
import 'package:restaurant_app/routes/route_helper.dart';
import 'package:restaurant_app/utils/app_logo.dart';
import 'package:restaurant_app/utils/app_text_field.dart';
import 'package:restaurant_app/utils/colors.dart';
import 'package:restaurant_app/utils/custom_loader.dart';
import 'package:restaurant_app/utils/dimensions.dart';
import 'package:restaurant_app/utils/go_to_initial_page_button.dart';
import 'package:restaurant_app/utils/widgets.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool _isLoading = false;
  AuthRepo authService = AuthRepo();
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
                color: Theme.of(context).primaryColor),
          )
              : SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20,
                  vertical: Dimensions.height30 * 2),
              child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const GoToInitialPageIcon(),
                      SizedBox(height: Dimensions.height20 * 4),
                      const AppLogo(),
                      SizedBox(height: Dimensions.height10),
                      SizedBox(
                        child: AppTextField(
                          icon: Icons.email,
                          labelText: "ایمیل",
                          isObscure: false,
                          error: "لطفا ایمیل را به درستی وارد کنید.",
                          controller: emailController,
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        child: AppTextField(
                          icon: Icons.lock,
                          labelText: "رمز عبور",
                          isObscure: false,
                          error: "لطفا قسمت نام و نام خانوادگی را تکمیل نمایید.",
                          controller: passwordController,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: Dimensions.height20 * 2,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).primaryColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          child: const Text(
                            "ورود",
                            style: TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                          onPressed: () {
                            var email = emailController.text;
                            var password = passwordController.text;
                            login(_authController, email, password);
                            // login();
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text.rich(TextSpan(
                        text: "شما اکانت نداربد؟ ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Dimensions.font16 * 0.8),
                        children: <TextSpan>[
                          TextSpan(
                              text: "الان ثبت نام کنید",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.toNamed(
                                      RouteHelper.getRegisterPage());
                                }),
                        ],
                      )),
                    ],
                  )),
            ),
          ),
        )
            : CustomLoader();
      })

    );
  }

  login(AuthController authController, String email, String password ) async {
    if (formKey.currentState!.validate()) {
      await authController.login(email, password);
      }
    }
}
