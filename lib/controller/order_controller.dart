import 'dart:convert';

import 'package:get/get.dart';
import 'package:restaurant_app/model/cart_model.dart';
import 'package:restaurant_app/repository/order_repo.dart';

class OrderController extends GetxController{

  final OrderRepo orderRepo;

  OrderController({required this.orderRepo});


  int _quantity = 0;
  int get quantity => _quantity;

  int _product = 0;
  int get product => _product;

  int _counter = 0;
  int get counter => _counter;

  List<CartModel> _taskList = [];
  List<CartModel> get taskList => _taskList;

  void setQuantity(String name, bool isIncrement){
    if(isIncrement){
      _quantity = checkQuantity(_quantity+1);
      orderRepo.addCount(name, _quantity);
    }else{
      _quantity = checkQuantity(_quantity-1);
      orderRepo.removeCount(name, _quantity);
    }
    update();
  }

  Future<dynamic> fetchData() async{
    print("111111111111111111111111111111    ");
    var response = await orderRepo.fetchDataRepo();
    print("333333333333333333333333333333333    "+response.statusCode.toString());
    if(response.statusCode == 200){
      Iterable l = json.decode(response.body);
      _taskList = List<CartModel>.from(l.map((model)=> CartModel.fromJson(model)));
      print("333333333333333333333333333333333    "+_taskList.toString());
      update();
    }
  }

  Future<int> getCounter(String name){
    return orderRepo.getCountRepo(name);
  }

  // setCount(String name, int count){
  //   orderRepo.setCountRepo(name, count);
  // }

  int checkQuantity(int quantity) {
    if (quantity < 0) {
      Get.snackbar('Item count', 'You cannot reduce more!');
      return 0;
    } else if (quantity > 20) {
      Get.snackbar('Item count', 'You cannot add more!');
      return quantity-1;
    } else {
      return quantity;
    }
  }
}