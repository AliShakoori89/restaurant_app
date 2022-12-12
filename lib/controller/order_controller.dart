import 'package:get/get.dart';
import 'package:restaurant_app/repository/order_repo.dart';

class OrderController extends GetxController{

  final OrderRepo orderRepo;

  OrderController({required this.orderRepo});


  int _quantity = 0;
  int get quantity => _quantity;

  void setQuantity(bool isIncrement){
    if(isIncrement){
      _quantity = checkQuantity(_quantity+1);
    }else{
      _quantity = checkQuantity(_quantity-1);
    }
    update();
  }

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