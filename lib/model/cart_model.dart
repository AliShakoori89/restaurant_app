import 'package:restaurant_app/model/products_model.dart';

class CartModel {
  int? id;
  String? name;
  int? price;
  int? quantity;
  String? time;

  CartModel(
      {this.id,
        this.name,
        this.price,
        this.quantity,
        this.time});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
      'time': time,
    };
  }
}