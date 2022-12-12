import 'dart:convert';
import 'package:restaurant_app/widget/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderRepo {
  final SharedPreferences sharedPreferences;
  OrderRepo({required this.sharedPreferences});

  List<String> cart = [];

  // void addToCartList(List<FoodModel> cartList) {
  //   // sharedPreferences.remove(AppConstants.cartList);
  //   // sharedPreferences.remove(AppConstants.cartHistoryList);
  //   cart = [];
  //   var time = DateTime.now().toString();
  //   cartList.forEach((element) {
  //     element.time = time;
  //     element.price =
  //     return cart.add(jsonEncode(element));
  //   });
  //   sharedPreferences.setStringList(AppConstants.cartList, cart);
  //   //print(sharedPreferences.getStringList(AppConstants.cartList));
  // }
}