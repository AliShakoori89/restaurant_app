import 'package:flutter/material.dart';
import 'package:restaurant_app/widget/dimensions.dart';
import 'package:restaurant_app/widget/food_menu_icon.dart';

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
              FoodMenuIcon(controller: controller, imagePath: "unselectedPotable.png", iconName: "نوشیدنی",),
              SizedBox(width: Dimensions.width45,),
              FoodMenuIcon(controller: controller, imagePath: "unselectedAppetizer.png", iconName: "پیش عذا",),
              SizedBox(width: Dimensions.width45,),
              FoodMenuIcon(controller: controller, imagePath: "unselectedPutin.png", iconName: "پوتین",),
              SizedBox(width: Dimensions.width45,),
              FoodMenuIcon(controller: controller, imagePath: "unselectedFriedChicken.png", iconName: "سوخاری",),
              SizedBox(width: Dimensions.width45,),
              FoodMenuIcon(controller: controller, imagePath: "unselectedHotSandwich.png", iconName: "ساندویچ گرم",),
              SizedBox(width: Dimensions.width45,),
              FoodMenuIcon(controller: controller, imagePath: "unselectedBerger.png", iconName: "برگر",),
              SizedBox(width: Dimensions.width45,),
              FoodMenuIcon(controller: controller, imagePath: "unselectedHotDog.png", iconName: "هات داگ",),
              SizedBox(width: Dimensions.width45,),
              FoodMenuIcon(controller: controller, imagePath: "unselectedPizza.png", iconName: "پیتزا",),
              SizedBox(width: Dimensions.width45,),
              FoodMenuIcon(controller: controller, imagePath: "unselectedCombo.png", iconName: "کمبو",)
            ]
        ),
      ),
    );
  }
}
