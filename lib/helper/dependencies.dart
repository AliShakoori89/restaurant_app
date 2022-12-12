import 'package:restaurant_app/controller/auth_controller.dart';
import 'package:restaurant_app/controller/branch_controller.dart';
import 'package:restaurant_app/controller/icon_selected_controller.dart';
import 'package:restaurant_app/controller/order_controller.dart';
import 'package:restaurant_app/repository/auth_repo.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/repository/branch_repo.dart';
import 'package:restaurant_app/repository/icon_selected_repo.dart';
import 'package:restaurant_app/repository/order_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async{

  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(()=> sharedPreferences);
  //api client
  // Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUrl, sharedPreferences: Get.find()));
  Get.lazyPut(() => AuthRepo());
  Get.lazyPut(() => IconSelectedRepo());
  Get.lazyPut(() => OrderRepo(sharedPreferences: Get.find()));
  Get.lazyPut(() => BranchRepo(sharedPreferences: Get.find()));
  // Get.lazyPut(() => UserRepo(apiClient: Get.find()));
  //
  // //repos
  // Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  // Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  // Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  // Get.lazyPut(() => LocationRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  // //controllers
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => BranchController(branchRepo: Get.find()));
  Get.lazyPut(() => OrderController(orderRepo: Get.find()));
  Get.lazyPut(() => IconSelectedController(iconSelectedRepo: Get.find()));
  // Get.lazyPut(() => UserController(userRepo: Get.find()));
  // Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  // Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  // Get.lazyPut(() => CartController(cartRepo: Get.find()));
  // Get.lazyPut(() => LocationController(locationRepo: Get.find()));

}