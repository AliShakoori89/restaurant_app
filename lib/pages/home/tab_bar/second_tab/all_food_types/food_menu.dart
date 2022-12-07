import 'dart:convert';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/pages/home/tab_bar/second_tab/all_food_types/food_detail.dart';

class FoodMenu extends StatefulWidget {

  final ScrollController controller;

  FoodMenu({Key? key, required this.controller}) : super(key: key);

  @override
  State<FoodMenu> createState() => _FoodMenuState(controller);
}

class _FoodMenuState extends State<FoodMenu> {
  List allCombo = [];
  List allPizza = [];
  List allBerger = [];
  List allHotDog = [];
  List allHotSandwich = [];
  List allFriedChicken = [];
  List allPutin = [];
  List allAppetizer = [];
  List allPotable = [];

  final ScrollController controller;

  _FoodMenuState(this.controller);

  get _fireStoreInstance => FirebaseFirestore.instance;

  fetchRestaurantComboFood() async{

    QuerySnapshot qn = await _fireStoreInstance.collection('fast food menu').get();
    setState(() {
      for(int i = 0; i<qn.docs.length; i++){
        allCombo.add(
            {
              "name": qn.docs[i]["name"],
              "detail": qn.docs[i]["detail"],
              "image": qn.docs[i]["image"],
              "price": qn.docs[i]["price"],
            }
        );
      }

    });
    return qn.docs;
  }

  fetchRestaurantPizza() async{

    QuerySnapshot qn = await _fireStoreInstance.collection('pizza menu').get();
    setState(() {
      for(int i = 0; i<qn.docs.length; i++){
        allPizza.add(
            {
              "name": qn.docs[i]["name"],
              "detail": qn.docs[i]["detail"],
              "image": qn.docs[i]["image"],
              "price": qn.docs[i]["price"],
            }
        );
      }
    });
    return qn.docs;
  }

  fetchRestaurantBerger() async{

    QuerySnapshot qn = await _fireStoreInstance.collection('berger').get();
    setState(() {
      for(int i = 0; i<qn.docs.length; i++){
        allBerger.add(
            {
              "name": qn.docs[i]["name"],
              "detail": qn.docs[i]["detail"],
              "image": qn.docs[i]["image"],
              "price": qn.docs[i]["price"],
            }
        );
      }

    });
    return qn.docs;
  }

  fetchRestaurantHotDog() async{

    QuerySnapshot qn = await _fireStoreInstance.collection('hotdog').get();
    setState(() {
      for(int i = 0; i<qn.docs.length; i++){
        allHotDog.add(
            {
              "name": qn.docs[i]["name"],
              "detail": qn.docs[i]["detail"],
              "image": qn.docs[i]["image"],
              "price": qn.docs[i]["price"],
            }
        );
      }

    });
    return qn.docs;
  }

  fetchRestaurantHotSandwich() async{

    QuerySnapshot qn = await _fireStoreInstance.collection('hot sandwich').get();
    setState(() {
      for(int i = 0; i<qn.docs.length; i++){
        allHotSandwich.add(
            {
              "name": qn.docs[i]["name"],
              "detail": qn.docs[i]["detail"],
              "image": qn.docs[i]["image"],
              "price": qn.docs[i]["price"],
            }
        );
      }

    });
    return qn.docs;
  }

  fetchRestaurantFriedChicken() async{

    QuerySnapshot qn = await _fireStoreInstance.collection('fried chicken').get();
    setState(() {
      for(int i = 0; i<qn.docs.length; i++){
        allFriedChicken.add(
            {
              "name": qn.docs[i]["name"],
              "detail": qn.docs[i]["detail"],
              "image": qn.docs[i]["image"],
              "price": qn.docs[i]["price"],
            }
        );
      }

    });
    return qn.docs;
  }

  fetchRestaurantPutin() async{

    QuerySnapshot qn = await _fireStoreInstance.collection('putin').get();
    setState(() {
      for(int i = 0; i<qn.docs.length; i++){
        allPutin.add(
            {
              "name": qn.docs[i]["name"],
              "detail": qn.docs[i]["detail"],
              "image": qn.docs[i]["image"],
              "price": qn.docs[i]["price"],
            }
        );
      }

    });
    return qn.docs;
  }

  fetchRestaurantAppetizer() async{

    QuerySnapshot qn = await _fireStoreInstance.collection('appetizer').get();
    setState(() {
      for(int i = 0; i<qn.docs.length; i++){
        allAppetizer.add(
            {
              "name": qn.docs[i]["name"],
              "detail": qn.docs[i]["detail"],
              "image": qn.docs[i]["image"],
              "price": qn.docs[i]["price"],
            }
        );
      }

    });
    return qn.docs;
  }

  fetchRestaurantPotable() async{

    QuerySnapshot qn = await _fireStoreInstance.collection('potable').get();
    setState(() {
      for(int i = 0; i<qn.docs.length; i++){
        allPotable.add(
            {
              "name": qn.docs[i]["name"],
              "image": qn.docs[i]["image"],
              "price": qn.docs[i]["price"],
            }
        );
      }

    });
    return qn.docs;
  }

  Uint8List convertBase64Image(String base64String) {
    return const Base64Decoder().convert(base64String.split(',').last);
  }

  @override
  void initState() {
    fetchRestaurantComboFood();
    fetchRestaurantPizza();
    fetchRestaurantBerger();
    fetchRestaurantHotDog();
    fetchRestaurantHotSandwich();
    fetchRestaurantFriedChicken();
    fetchRestaurantPutin();
    fetchRestaurantAppetizer();
    fetchRestaurantPotable();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget.controller,
      child: Column(
        children: [
          FoodDetail(allFoodSameType: allCombo, foodTypeName: "کمبو"),
          FoodDetail(allFoodSameType: allPizza, foodTypeName: "پیتزا"),
          FoodDetail(allFoodSameType: allHotDog, foodTypeName: "هات داگ"),
          FoodDetail(allFoodSameType: allBerger, foodTypeName: "برگر"),
          FoodDetail(allFoodSameType: allHotSandwich, foodTypeName: "ساندویچ گرم"),
          FoodDetail(allFoodSameType: allFriedChicken, foodTypeName: "سوخاری"),
          FoodDetail(allFoodSameType: allPutin, foodTypeName: "پوتین"),
          FoodDetail(allFoodSameType: allAppetizer, foodTypeName: "پیش غذا"),
          FoodDetail(allFoodSameType: allPotable, foodTypeName: "نوشیدنی"),
        ],
      ),
    );
  }
}
