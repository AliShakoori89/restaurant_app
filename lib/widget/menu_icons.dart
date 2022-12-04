import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/controller/icon_selected_controller.dart';
import 'package:restaurant_app/widget/dimensions.dart';
import 'package:restaurant_app/widget/food_menu_icon.dart';

class MenuIcons extends StatelessWidget {

  final ScrollController controller;
  final ScrollController nestedController;
  String selected;

  MenuIcons({Key? key, required this.controller, required this.nestedController, required this.selected}) : super(key: key);

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
        child: GetBuilder<IconSelectedController>(builder: (selectController){

    return Row(
            children: [
              SizedBox(width: Dimensions.width45,),
              GestureDetector(
                onTap: (){
                  selectController.scrollMenuListAfterSelect("نوشیدنی", controller, nestedController);
                },
                child: Column(
                  children: [
                    selected != "comboSelected"
                        ? Image.asset("assets/images/unselected_food_types/unselectedPotable.png", width: Dimensions.width45)
                        : Image.asset("assets/images/selected_food_types/selectedPotable.png", width: Dimensions.width45),
                    Text("نوشیدنی", style: TextStyle(color: Colors.grey[900]))
                  ],
                ),
              ),
              SizedBox(width: Dimensions.width45,),
              GestureDetector(
                onTap: (){
                  selectController.iconSelectedRepo.changeIconTypeRepo("پیش غذا", controller, nestedController);
                },
                child: Column(
                  children: [
                    selected != "appetizerSelected"
                        ? Image.asset("assets/images/unselected_food_types/unselectedAppetizer.png", width: Dimensions.width45)
                        : Image.asset("assets/images/selected_food_types/selectedAppetizer.png", width: Dimensions.width45),
                    Text("پیش غذا", style: TextStyle(color: Colors.grey[900]))
                  ],
                ),
              ),
              SizedBox(width: Dimensions.width45,),
              GestureDetector(
                onTap: (){
                  selectController.iconSelectedRepo.changeIconTypeRepo("پوتین", controller, nestedController);
                },
                child: Column(
                  children: [
                    selected != "putinSelected"
                        ? Image.asset("assets/images/unselected_food_types/unselectedPutin.png", width: Dimensions.width45)
                        : Image.asset("assets/images/selected_food_types/selectedPutin.png", width: Dimensions.width45),
                    Text("پوتین", style: TextStyle(color: Colors.grey[900]))
                  ],
                ),
              ),
              SizedBox(width: Dimensions.width45,),
              GestureDetector(
                onTap: (){
                  selectController.iconSelectedRepo.changeIconTypeRepo("سوخاری", controller, nestedController);
                },
                child: Column(
                  children: [
                    selected != "friedChickenSelected"
                        ? Image.asset("assets/images/unselected_food_types/unselectedFriedChicken.png", width: Dimensions.width45)
                        : Image.asset("assets/images/selected_food_types/selectedFriedChicken.png", width: Dimensions.width45),
                    Text("سوخاری", style: TextStyle(color: Colors.grey[900]))
                  ],
                ),
              ),
              SizedBox(width: Dimensions.width45,),
              GestureDetector(
                onTap: (){
                  selectController.iconSelectedRepo.changeIconTypeRepo("ساندویچ گرم", controller, nestedController);
                },
                child: Column(
                  children: [
                    selected != "hotSandwichSelected"
                        ? Image.asset("assets/images/unselected_food_types/unselectedHotSandwich.png", width: Dimensions.width45)
                        : Image.asset("assets/images/selected_food_types/selectedHotSandwich.png", width: Dimensions.width45),
                    Text("ساندویچ گرم", style: TextStyle(color: Colors.grey[900]))
                  ],
                ),
              ),
              SizedBox(width: Dimensions.width45,),
              GestureDetector(
                onTap: (){
                  selectController.iconSelectedRepo.changeIconTypeRepo("برگر", controller, nestedController);
                },
                child: Column(
                  children: [
                    selected != "bergerSelected"
                        ? Image.asset("assets/images/unselected_food_types/unselectedBerger.png", width: Dimensions.width45)
                        : Image.asset("assets/images/selected_food_types/selectedBerger.png", width: Dimensions.width45),
                    Text("برگر", style: TextStyle(color: Colors.grey[900]))
                  ],
                ),
              ),
              SizedBox(width: Dimensions.width45,),
              GestureDetector(
                onTap: (){
                  selectController.iconSelectedRepo.changeIconTypeRepo("هات داگ", controller, nestedController);
                },
                child: Column(
                  children: [
                    selected != "hotDogSelected"
                        ? Image.asset("assets/images/unselected_food_types/unselectedHotDog.png", width: Dimensions.width45)
                        : Image.asset("assets/images/selected_food_types/selectedHotDog.png", width: Dimensions.width45),
                    Text("هات داگ", style: TextStyle(color: Colors.grey[900]))
                  ],
                ),
              ),
              SizedBox(width: Dimensions.width45,),
              GestureDetector(
                onTap: (){
                  selectController.iconSelectedRepo.changeIconTypeRepo("پیتزا", controller, nestedController);
                },
                child: Column(
                  children: [
                    selected != "pizzaSelected"
                        ? Image.asset("assets/images/unselected_food_types/unselectedPizza.png", width: Dimensions.width45)
                        : Image.asset("assets/images/selected_food_types/selectedPizza.png", width: Dimensions.width45),
                    Text("پیتزا", style: TextStyle(color: Colors.grey[900]))
                  ],
                ),
              ),
              SizedBox(width: Dimensions.width45,),
              GestureDetector(
                onTap: (){
                  selectController.iconSelectedRepo.changeIconTypeRepo("کمبو", controller, nestedController);
                },
                child: Column(
                  children: [
                    selected != "comboSelected"
                        ? Image.asset("assets/images/unselected_food_types/unselectedCombo.png", width: Dimensions.width45)
                        : Image.asset("assets/images/selected_food_types/selectedCombo.png", width: Dimensions.width45),
                    Text("کمبو", style: TextStyle(color: Colors.grey[900]))
                  ],
                ),
              ),
            ]
        );
        })
      ),
    );
  }
}
