import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/controller/auth_controller.dart';
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
                          labelText: "??????????",
                          isObscure: false,
                          error: "???????? ?????????? ???? ???? ?????????? ???????? ????????.",
                          controller: emailController,
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        child: AppTextField(
                          icon: Icons.lock,
                          labelText: "?????? ????????",
                          isObscure: false,
                          error: "???????? ???????? ?????? ?? ?????? ???????????????? ???? ?????????? ????????????.",
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
                            "????????",
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
                        text: "?????? ?????????? ?????????????? ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Dimensions.font16 * 0.8),
                        children: <TextSpan>[
                          TextSpan(
                              text: "???????? ?????? ?????? ????????",
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
