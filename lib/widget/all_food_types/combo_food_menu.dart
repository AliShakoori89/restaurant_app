import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/widget/dimensions.dart';

class ComboFoodMenu extends StatefulWidget {
  ComboFoodMenu({Key? key}) : super(key: key);

  @override
  State<ComboFoodMenu> createState() => _ComboFoodMenuState();
}

class _ComboFoodMenuState extends State<ComboFoodMenu> {
  List allFood = [];

  get _fireStoreInstance => FirebaseFirestore.instance;

  fetchRestaurantFoodMenu() async{

    QuerySnapshot qn = await _fireStoreInstance.collection('fast food menu').get();
    setState(() {
      for(int i = 0; i<qn.docs.length; i++){
        allFood.add(
            {
              "name": qn.docs[i]["name"],
              "detail": qn.docs[i]["detail"],
              "image": qn.docs[i]["image"],
              "price": qn.docs[i]["price"],
            }
        );
        print("qn.docs[i][name] "+qn.docs[i]["name"]);
      }

    });
    return qn.docs;
  }

  Uint8List convertBase64Image(String base64String) {
    return const Base64Decoder().convert(base64String.split(',').last);
  }

  @override
  void initState() {
    fetchRestaurantFoodMenu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: allFood.length,
      reverse: true,
      padding: EdgeInsets.only(top: Dimensions.height20),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,

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
              Image.memory(convertBase64Image(allFood[index]["image"]),
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
                    Text(allFood[index]["name"],
                      style: TextStyle(fontSize: Dimensions.font20,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),),
                    SizedBox(height: Dimensions.height10/2,),
                    Text(allFood[index]["detail"],
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
                        Text(allFood[index]["price"]+' تومان',
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
      );
  }
}
