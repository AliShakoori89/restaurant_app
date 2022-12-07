import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:restaurant_app/widget/dimensions.dart';
class FoodDetail extends StatelessWidget {

  final String foodTypeName;
  final List allFoodSameType;

  FoodDetail({Key? key, required this.allFoodSameType, required this.foodTypeName}) : super(key: key);

  Uint8List convertBase64Image(String base64String) {
    return const Base64Decoder().convert(base64String.split(',').last);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(
                right: Dimensions.width20
            ),
            child: Text(foodTypeName,
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
          itemCount: allFoodSameType.length,
          padding: EdgeInsets.only(top: Dimensions.height20),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index){
            return allFoodSameType[index]["detail"] == null
                ? Padding(
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
                    Image.memory(convertBase64Image(allFoodSameType[index]["image"]),
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
                          SizedBox(height: Dimensions.height10,),
                          Text(allFoodSameType[index]["name"],
                            style: TextStyle(fontSize: Dimensions.font20,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),),
                          SizedBox(height: Dimensions.height10/2,),
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
                              Text(allFoodSameType[index]["price"]+' تومان',
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
            )
                : Container(
              width: Dimensions.width45*10,
              height: Dimensions.height45*10.1,
              child: Padding(
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
                      Image.memory(convertBase64Image(allFoodSameType[index]["image"]),
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
                            SizedBox(height: Dimensions.height10,),
                            Text(allFoodSameType[index]["name"],
                              style: TextStyle(fontSize: Dimensions.font20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),),
                            SizedBox(height: Dimensions.height10/2,),
                            Text(allFoodSameType[index]["detail"],
                              textDirection: TextDirection.rtl,
                              style: TextStyle(fontSize: Dimensions.font16,
                                  color: Colors.black),),
                            SizedBox(height: Dimensions.height20,),
                            const SizedBox(),
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
                                Text(allFoodSameType[index]["price"]+' تومان',
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
              ),
            );
          },
        ),
      ],
    );
  }
}
