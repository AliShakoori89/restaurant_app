import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderRepo {

  int? quantity;
  String? name;
  final SharedPreferences sharedPreferences;
  OrderRepo({this.quantity, this.name, required this.sharedPreferences});

  addCount(name, quantity){
    if(name == "سوپر کمبو"){
      FirebaseFirestore.instance.collection('fast food menu').doc('7QflL9dULx8scj6hvUiN').update({'count': quantity});
      sharedPreferences.setString(name, quantity.toString());
    }
  }

  removeCount(name, quantity){
    if(name == "سوپر کمبو"){
      FirebaseFirestore.instance.collection('fast food menu').doc('7QflL9dULx8scj6hvUiN').update({'count': quantity});
      sharedPreferences.setString(name, quantity.toString());
    }
  }

  // setCountRepo(String name, int count) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setInt(name ,count );
  // }

  Future<int> getCountRepo(String name) async{
    print(" name name name    "+ name);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? counter = prefs.getInt(name);
    return counter!;
  }

  Future<int> fetchDataRepo() async{
    var data = await FirebaseFirestore.instance.collection("fast food menu").doc('7QflL9dULx8scj6hvUiN').get();
    final count = await data.data()?['count'];
    print("*&&&&*&*&*&&&&*&*&*&*&*&*&*&&&    "+ count.toString());
    return count;
  }
}