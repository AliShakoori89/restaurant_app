import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/widget/dimensions.dart';

class ComboFoodMenu extends StatefulWidget {

  final ScrollController controller;

  ComboFoodMenu({Key? key, required this.controller}) : super(key: key);

  @override
  State<ComboFoodMenu> createState() => _ComboFoodMenuState(controller);
}

class _ComboFoodMenuState extends State<ComboFoodMenu> {
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

  _ComboFoodMenuState(this.controller);

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
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(
                  right: Dimensions.width20
              ),
              child: Text("کمبو",
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w700,
                    fontSize: Dimensions.font26
                ),),
            ),
          ),
          SizedBox(height: Dimensions.height10/2,),
          ListView.builder(
            shrinkWrap: true,
            itemCount: allCombo.length,
            padding: EdgeInsets.only(top: Dimensions.height20),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              return Padding(
                padding: EdgeInsets.only(bottom: Dimensions.height20),
                child: Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)
                  ),
                  child: Column(
                    children: [
                      Image.memory(convertBase64Image(allCombo[index]["image"]),
                        gaplessPlayback: true,),
                      // Image.asset("assets/images/combo_food/combo.png",
                      //     alignment: Alignment.topCenter),
                      Container(
                        margin: EdgeInsets.only(
                          left: Dimensions.width10,
                          right: Dimensions.width10,
                          bottom: Dimensions.width10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(allCombo[index]["name"],
                              style: TextStyle(fontSize: Dimensions.font20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),),
                            SizedBox(height: Dimensions.height10/2,),
                            Text(allCombo[index]["detail"],
                              textDirection: TextDirection.rtl,
                              style: TextStyle(fontSize: Dimensions.font16,
                                  color: Colors.black),),
                            SizedBox(height: Dimensions.height20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: Dimensions.width45,
                                  height: Dimensions.width45,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.redAccent)
                                  ),
                                  child: const Icon(Icons.add, color: Colors.black,),
                                ),
                                Text(allCombo[index]["price"]+' تومان',
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: Dimensions.font16
                                  ),)
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(
                  right: Dimensions.width20
              ),
              child: Text("پیتزا",
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w700,
                    fontSize: Dimensions.font26
                ),),
            ),
          ),
          SizedBox(height: Dimensions.height10/2,),
          ListView.builder(
            shrinkWrap: true,
            itemCount: allPizza.length,
            padding: EdgeInsets.only(top: Dimensions.height20),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              return Padding(
                padding: EdgeInsets.only(bottom: Dimensions.height20),
                child: Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)
                  ),
                  child: Column(
                    children: [
                      Image.memory(convertBase64Image(allPizza[index]["image"]),
                        gaplessPlayback: true,),
                      // Image.asset("assets/images/combo_food/combo.png",
                      //     alignment: Alignment.topCenter),
                      Container(
                        margin: EdgeInsets.only(
                          left: Dimensions.width10,
                          right: Dimensions.width10,
                          bottom: Dimensions.width10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(allPizza[index]["name"],
                              style: TextStyle(fontSize: Dimensions.font20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),),
                            SizedBox(height: Dimensions.height10/2,),
                            Text(allPizza[index]["detail"],
                              textDirection: TextDirection.rtl,
                              style: TextStyle(fontSize: Dimensions.font16,
                                  color: Colors.black),),
                            SizedBox(height: Dimensions.height20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: Dimensions.width45,
                                  height: Dimensions.width45,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.redAccent)
                                  ),
                                  child: const Icon(Icons.add, color: Colors.black,),
                                ),
                                Text(allPizza[index]["price"]+' تومان',
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: Dimensions.font16
                                  ),)
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(
                  right: Dimensions.width20
              ),
              child: Text("هات داگ",
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w700,
                    fontSize: Dimensions.font26
                ),),
            ),
          ),
          SizedBox(height: Dimensions.height10/2,),
          ListView.builder(
            shrinkWrap: true,
            itemCount: allHotDog.length,
            padding: EdgeInsets.only(top: Dimensions.height20),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              return Padding(
                padding: EdgeInsets.only(bottom: Dimensions.height20),
                child: Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)
                  ),
                  child: Column(
                    children: [
                      Image.memory(convertBase64Image(allHotDog[index]["image"]),
                        gaplessPlayback: true,),
                      // Image.asset("assets/images/combo_food/combo.png",
                      //     alignment: Alignment.topCenter),
                      Container(
                        margin: EdgeInsets.only(
                          left: Dimensions.width10,
                          right: Dimensions.width10,
                          bottom: Dimensions.width10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(allHotDog[index]["name"],
                              style: TextStyle(fontSize: Dimensions.font20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),),
                            SizedBox(height: Dimensions.height10/2,),
                            Text(allHotDog[index]["detail"],
                              textDirection: TextDirection.rtl,
                              style: TextStyle(fontSize: Dimensions.font16,
                                  color: Colors.black),),
                            SizedBox(height: Dimensions.height20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: Dimensions.width45,
                                  height: Dimensions.width45,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.redAccent)
                                  ),
                                  child: const Icon(Icons.add, color: Colors.black,),
                                ),
                                Text(allHotDog[index]["price"]+' تومان',
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: Dimensions.font16
                                  ),)
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(
                  right: Dimensions.width20
              ),
              child: Text("برگر",
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w700,
                    fontSize: Dimensions.font26
                ),),
            ),
          ),
          SizedBox(height: Dimensions.height10/2,),
          ListView.builder(
            shrinkWrap: true,
            itemCount: allBerger.length,
            padding: EdgeInsets.only(top: Dimensions.height20),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              return Padding(
                padding: EdgeInsets.only(bottom: Dimensions.height20),
                child: Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)
                  ),
                  child: Column(
                    children: [
                      Image.memory(convertBase64Image(allBerger[index]["image"]),
                        gaplessPlayback: true,),
                      // Image.asset("assets/images/combo_food/combo.png",
                      //     alignment: Alignment.topCenter),
                      Container(
                        margin: EdgeInsets.only(
                          left: Dimensions.width10,
                          right: Dimensions.width10,
                          bottom: Dimensions.width10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(allBerger[index]["name"],
                              style: TextStyle(fontSize: Dimensions.font20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),),
                            SizedBox(height: Dimensions.height10/2,),
                            Text(allBerger[index]["detail"],
                              textDirection: TextDirection.rtl,
                              style: TextStyle(fontSize: Dimensions.font16,
                                  color: Colors.black),),
                            SizedBox(height: Dimensions.height20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: Dimensions.width45,
                                  height: Dimensions.width45,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.redAccent)
                                  ),
                                  child: const Icon(Icons.add, color: Colors.black,),
                                ),
                                Text(allBerger[index]["price"]+' تومان',
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: Dimensions.font16
                                  ),)
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(
                  right: Dimensions.width20
              ),
              child: Text("ساندویچ گرم",
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w700,
                    fontSize: Dimensions.font26
                ),),
            ),
          ),
          SizedBox(height: Dimensions.height10/2,),
          ListView.builder(
            shrinkWrap: true,
            itemCount: allHotSandwich.length,
            padding: EdgeInsets.only(top: Dimensions.height20),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              return Padding(
                padding: EdgeInsets.only(bottom: Dimensions.height20),
                child: Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)
                  ),
                  child: Column(
                    children: [
                      Image.memory(convertBase64Image(allHotSandwich[index]["image"]),
                        gaplessPlayback: true,),
                      // Image.asset("assets/images/combo_food/combo.png",
                      //     alignment: Alignment.topCenter),
                      Container(
                        margin: EdgeInsets.only(
                          left: Dimensions.width10,
                          right: Dimensions.width10,
                          bottom: Dimensions.width10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(allHotSandwich[index]["name"],
                              style: TextStyle(fontSize: Dimensions.font20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),),
                            SizedBox(height: Dimensions.height10/2,),
                            Text(allHotSandwich[index]["detail"],
                              textDirection: TextDirection.rtl,
                              style: TextStyle(fontSize: Dimensions.font16,
                                  color: Colors.black),),
                            SizedBox(height: Dimensions.height20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: Dimensions.width45,
                                  height: Dimensions.width45,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.redAccent)
                                  ),
                                  child: const Icon(Icons.add, color: Colors.black,),
                                ),
                                Text(allHotSandwich[index]["price"]+' تومان',
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: Dimensions.font16
                                  ),)
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(
                  right: Dimensions.width20
              ),
              child: Text("سوخاری",
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w700,
                    fontSize: Dimensions.font26
                ),),
            ),
          ),
          SizedBox(height: Dimensions.height10/2,),
          ListView.builder(
            shrinkWrap: true,
            itemCount: allFriedChicken.length,
            padding: EdgeInsets.only(top: Dimensions.height20),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              return Padding(
                padding: EdgeInsets.only(bottom: Dimensions.height20),
                child: Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)
                  ),
                  child: Column(
                    children: [
                      Image.memory(convertBase64Image(allFriedChicken[index]["image"]),
                        gaplessPlayback: true,),
                      // Image.asset("assets/images/combo_food/combo.png",
                      //     alignment: Alignment.topCenter),
                      Container(
                        margin: EdgeInsets.only(
                          left: Dimensions.width10,
                          right: Dimensions.width10,
                          bottom: Dimensions.width10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(allFriedChicken[index]["name"],
                              style: TextStyle(fontSize: Dimensions.font20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),),
                            SizedBox(height: Dimensions.height10/2,),
                            Text(allFriedChicken[index]["detail"],
                              textDirection: TextDirection.rtl,
                              style: TextStyle(fontSize: Dimensions.font16,
                                  color: Colors.black),),
                            SizedBox(height: Dimensions.height20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: Dimensions.width45,
                                  height: Dimensions.width45,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.redAccent)
                                  ),
                                  child: const Icon(Icons.add, color: Colors.black,),
                                ),
                                Text(allFriedChicken[index]["price"]+' تومان',
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: Dimensions.font16
                                  ),)
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(
                  right: Dimensions.width20
              ),
              child: Text("پوتین",
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w700,
                    fontSize: Dimensions.font26
                ),),
            ),
          ),
          SizedBox(height: Dimensions.height10/2,),
          ListView.builder(
            shrinkWrap: true,
            itemCount: allPutin.length,
            padding: EdgeInsets.only(top: Dimensions.height20),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              return Padding(
                padding: EdgeInsets.only(bottom: Dimensions.height20),
                child: Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)
                  ),
                  child: Column(
                    children: [
                      Image.memory(convertBase64Image(allPutin[index]["image"]),
                        gaplessPlayback: true,),
                      // Image.asset("assets/images/combo_food/combo.png",
                      //     alignment: Alignment.topCenter),
                      Container(
                        margin: EdgeInsets.only(
                          left: Dimensions.width10,
                          right: Dimensions.width10,
                          bottom: Dimensions.width10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(allPutin[index]["name"],
                              style: TextStyle(fontSize: Dimensions.font20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),),
                            SizedBox(height: Dimensions.height10/2,),
                            Text(allPutin[index]["detail"],
                              textDirection: TextDirection.rtl,
                              style: TextStyle(fontSize: Dimensions.font16,
                                  color: Colors.black),),
                            SizedBox(height: Dimensions.height20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: Dimensions.width45,
                                  height: Dimensions.width45,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.redAccent)
                                  ),
                                  child: const Icon(Icons.add, color: Colors.black,),
                                ),
                                Text(allPutin[index]["price"]+' تومان',
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: Dimensions.font16
                                  ),)
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(
                  right: Dimensions.width20
              ),
              child: Text("پیش غذا",
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w700,
                    fontSize: Dimensions.font26
                ),),
            ),
          ),
          SizedBox(height: Dimensions.height10/2,),
          ListView.builder(
            shrinkWrap: true,
            itemCount: allAppetizer.length,
            padding: EdgeInsets.only(top: Dimensions.height20),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              return Padding(
                padding: EdgeInsets.only(bottom: Dimensions.height20),
                child: Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)
                  ),
                  child: Column(
                    children: [
                      Image.memory(convertBase64Image(allAppetizer[index]["image"]),
                        gaplessPlayback: true,),
                      // Image.asset("assets/images/combo_food/combo.png",
                      //     alignment: Alignment.topCenter),
                      Container(
                        margin: EdgeInsets.only(
                          left: Dimensions.width10,
                          right: Dimensions.width10,
                          bottom: Dimensions.width10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(allAppetizer[index]["name"],
                              style: TextStyle(fontSize: Dimensions.font20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),),
                            SizedBox(height: Dimensions.height10/2,),
                            Text(allAppetizer[index]["detail"],
                              textDirection: TextDirection.rtl,
                              style: TextStyle(fontSize: Dimensions.font16,
                                  color: Colors.black),),
                            SizedBox(height: Dimensions.height20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: Dimensions.width45,
                                  height: Dimensions.width45,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.redAccent)
                                  ),
                                  child: const Icon(Icons.add, color: Colors.black,),
                                ),
                                Text(allAppetizer[index]["price"]+' تومان',
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: Dimensions.font16
                                  ),)
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(
                  right: Dimensions.width20
              ),
              child: Text("نوشیدنی",
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w700,
                    fontSize: Dimensions.font26
                ),),
            ),
          ),
          SizedBox(height: Dimensions.height10/2,),
          ListView.builder(
            shrinkWrap: true,
            itemCount: allPotable.length,
            padding: EdgeInsets.only(top: Dimensions.height20),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              return Padding(
                padding: EdgeInsets.only(bottom: Dimensions.height20),
                child: Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)
                  ),
                  child: Column(
                    children: [
                      Image.memory(convertBase64Image(allPotable[index]["image"]),
                        gaplessPlayback: true,),
                      // Image.asset("assets/images/combo_food/combo.png",
                      //     alignment: Alignment.topCenter),
                      Container(
                        margin: EdgeInsets.only(
                          left: Dimensions.width10,
                          right: Dimensions.width10,
                          bottom: Dimensions.width10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(allPotable[index]["name"],
                              style: TextStyle(fontSize: Dimensions.font20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),),
                            SizedBox(height: Dimensions.height20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: Dimensions.width45,
                                  height: Dimensions.width45,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.redAccent)
                                  ),
                                  child: const Icon(Icons.add, color: Colors.black,),
                                ),
                                Text(allPotable[index]["price"]+' تومان',
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: Dimensions.font16
                                  ),)
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
