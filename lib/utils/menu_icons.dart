import 'package:flutter/material.dart';
import 'package:restaurant_app/utils/dimensions.dart';
import 'package:restaurant_app/utils/food_menu_icon.dart';

class MenuIcons extends StatelessWidget {

  ScrollController controller;

  MenuIcons({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: Dimensions.height10,
          right: Dimensions.width20,
          left: Dimensions.width20,
          bottom: Dimensions.height10
      ),
      child: SingleChildScrollView(
        reverse: true,
        scrollDirection: Axis.horizontal,
        child: Row(
            children: [
              SizedBox(width: Dimensions.width45,),
              FoodMenuIcon(controller: controller, imagePath: "unselectedDrink.png", iconName: "نوشیدنی",),
              SizedBox(width: Dimensions.width45,),
              FoodMenuIcon(controller: controller, imagePath: "unselectedPutin.png", iconName: "پیش عذا",),
              SizedBox(width: Dimensions.width45,),
              FoodMenuIcon(controller: controller, imagePath: "unselectedPutin.png", iconName: "پوتین",),
              SizedBox(width: Dimensions.width45,),
              FoodMenuIcon(controller: controller, imagePath: "unselectedSokhari.png", iconName: "سوخاری",),
              SizedBox(width: Dimensions.width45,),
              FoodMenuIcon(controller: controller, imagePath: "unselectedHotSandwich.png", iconName: "ساندویچ گرم",),
              SizedBox(width: Dimensions.width45,),
              FoodMenuIcon(controller: controller, imagePath: "unselectedBerger.png", iconName: "برگر",),
              SizedBox(width: Dimensions.width45,),
              FoodMenuIcon(controller: controller, imagePath: "unselectedHotdog.png", iconName: "هات داگ",),
              SizedBox(width: Dimensions.width45,),
              FoodMenuIcon(controller: controller, imagePath: "unselectedCombo.png", iconName: "پیتزا",),
              SizedBox(width: Dimensions.width45,),
              FoodMenuIcon(controller: controller, imagePath: "unselectedCombo.png", iconName: "کمبو",)
            ]
        ),
      ),
    );
  }
}
