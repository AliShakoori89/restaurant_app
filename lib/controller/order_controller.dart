import 'package:get/get.dart';
import 'package:restaurant_app/repository/order_repo.dart';

class OrderController extends GetxController{

  final OrderRepo orderRepo;

  OrderController({required this.orderRepo});


  int _quantity = 0;
  int get quantity => _quantity;

  int _count = 0;
  int get count => _count;

  int _counter = 0;
  int get counter => _counter;

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

  Future<void> fetchData() async{
    _count = await orderRepo.fetchDataRepo();
    print("???????????????????????????   "+_count.toString());

    update();
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