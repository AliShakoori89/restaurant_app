import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/controller/branch_controller.dart';
import 'package:restaurant_app/controller/icon_selected_controller.dart';
import 'package:restaurant_app/controller/order_controller.dart';
import 'package:restaurant_app/widget/colors.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;
import 'routes/route_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dep.init();
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ),);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
      return GetBuilder<BranchController>(builder: (_){
        return GetBuilder<IconSelectedController>(builder: (_){
          return GetBuilder<OrderController>(builder: (_){
            return GetMaterialApp(
              theme: ThemeData(
                  primaryColor: AppColors.mainColor,
                  scaffoldBackgroundColor: Colors.white),
              debugShowCheckedModeBanner: false,
              initialRoute: RouteHelper.getInitial(),
              // getSplashPage(),
              getPages: RouteHelper.routes,
              // home: _isSignedIn ? const HomePage() : const LoginPage(),
            );
        });
      });
    });
  }
}
