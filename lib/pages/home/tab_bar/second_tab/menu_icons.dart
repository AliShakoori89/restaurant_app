import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/controller/icon_selected_controller.dart';
import 'package:restaurant_app/widget/dimensions.dart';

class MenuIcons extends StatefulWidget {

  final ScrollController controller;
  final ScrollController nestedController;

  MenuIcons({Key? key, required this.controller, required this.nestedController}) : super(key: key);

  @override
  State<MenuIcons> createState() => _MenuIconsState();
}

class _MenuIconsState extends State<MenuIcons> {

  bool potableSelect = false;
  bool appetizerSelect = false;
  bool putinSelect = false;
  bool friedChickenSelect = false;
  bool hotSandwichSelect = false;
  bool bergerSelect = false;
  bool hotDogSelect = false;
  bool pizzaSelect = false;
  bool comboSelect = false;

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
        child: GetBuilder<IconSelectedController>(builder: (selectController) {
            return Row(children: [
              SizedBox(
                width: Dimensions.width45,
              ),
              GestureDetector(
                onTap: () {
                  selectController.scrollMenuListAfterSelect(
                      "نوشیدنی", widget.controller, widget.nestedController);
                  setState(() {
                    potableSelect = true;
                    appetizerSelect = false;
                    putinSelect = false;
                    friedChickenSelect = false;
                    hotSandwichSelect = false;
                    bergerSelect = false;
                    hotDogSelect = false;
                    pizzaSelect = false;
                    comboSelect = false;
                  });
                },
                child: Column(
                  children: [
                    potableSelect != true
                        ? Image.asset(
                            "assets/images/unselected_food_types/unselectedPotable.png",
                            width: Dimensions.width45)
                        : Image.asset(
                            "assets/images/selected_food_types/selectedPotable.png",
                            width: Dimensions.width45),
                    Text("نوشیدنی", style: TextStyle(color: Colors.grey[900]))
                  ],
                ),
              ),
              SizedBox(
                width: Dimensions.width45,
              ),
              GestureDetector(
                onTap: () {
                  selectController.iconSelectedRepo.changeIconTypeRepo(
                      "پیش غذا", widget.controller, widget.nestedController);
                  setState(() {
                    potableSelect = false;
                    appetizerSelect = true;
                    putinSelect = false;
                    friedChickenSelect = false;
                    hotSandwichSelect = false;
                    bergerSelect = false;
                    hotDogSelect = false;
                    pizzaSelect = false;
                    comboSelect = false;
                  });
                },
                child: Column(
                  children: [
                    appetizerSelect != true
                        ? Image.asset(
                            "assets/images/unselected_food_types/unselectedAppetizer.png",
                            width: Dimensions.width45)
                        : Image.asset(
                            "assets/images/selected_food_types/selectedAppetizer.png",
                            width: Dimensions.width45),
                    Text("پیش غذا", style: TextStyle(color: Colors.grey[900]))
                  ],
                ),
              ),
              SizedBox(
                width: Dimensions.width45,
              ),
              GestureDetector(
                onTap: () {
                  selectController.iconSelectedRepo.changeIconTypeRepo(
                      "پوتین", widget.controller, widget.nestedController);
                  setState(() {
                    potableSelect = false;
                    appetizerSelect = false;
                    putinSelect = true;
                    friedChickenSelect = false;
                    hotSandwichSelect = false;
                    bergerSelect = false;
                    hotDogSelect = false;
                    pizzaSelect = false;
                    comboSelect = false;
                  });
                },
                child: Column(
                  children: [
                    putinSelect != true
                        ? Image.asset(
                            "assets/images/unselected_food_types/unselectedPutin.png",
                            width: Dimensions.width45)
                        : Image.asset(
                            "assets/images/selected_food_types/selectedPutin.png",
                            width: Dimensions.width45),
                    Text("پوتین", style: TextStyle(color: Colors.grey[900]))
                  ],
                ),
              ),
              SizedBox(
                width: Dimensions.width45,
              ),
              GestureDetector(
                onTap: () {
                  selectController.iconSelectedRepo.changeIconTypeRepo(
                      "سوخاری", widget.controller, widget.nestedController);
                  setState(() {
                    potableSelect = false;
                    appetizerSelect = false;
                    putinSelect = false;
                    friedChickenSelect = true;
                    hotSandwichSelect = false;
                    bergerSelect = false;
                    hotDogSelect = false;
                    pizzaSelect = false;
                    comboSelect = false;
                  });
                },
                child: Column(
                  children: [
                    friedChickenSelect != true
                        ? Image.asset(
                            "assets/images/unselected_food_types/unselectedFriedChicken.png",
                            width: Dimensions.width45)
                        : Image.asset(
                            "assets/images/selected_food_types/selectedFriedChicken.png",
                            width: Dimensions.width45),
                    Text("سوخاری", style: TextStyle(color: Colors.grey[900]))
                  ],
                ),
              ),
              SizedBox(
                width: Dimensions.width45,
              ),
              GestureDetector(
                onTap: () {
                  selectController.iconSelectedRepo.changeIconTypeRepo(
                      "ساندویچ گرم", widget.controller, widget.nestedController);
                  setState(() {
                    potableSelect = false;
                    appetizerSelect = false;
                    putinSelect = false;
                    friedChickenSelect = false;
                    hotSandwichSelect = true;
                    bergerSelect = false;
                    hotDogSelect = false;
                    pizzaSelect = false;
                    comboSelect = false;
                  });
                },
                child: Column(
                  children: [
                    hotSandwichSelect != true
                        ? Image.asset(
                            "assets/images/unselected_food_types/unselectedHotSandwich.png",
                            width: Dimensions.width45)
                        : Image.asset(
                            "assets/images/selected_food_types/selectedHotSandwich.png",
                            width: Dimensions.width45),
                    Text("ساندویچ گرم",
                        style: TextStyle(color: Colors.grey[900]))
                  ],
                ),
              ),
              SizedBox(
                width: Dimensions.width45,
              ),
              GestureDetector(
                onTap: () {
                  selectController.iconSelectedRepo
                      .changeIconTypeRepo("برگر", widget.controller, widget.nestedController);
                  setState(() {
                    potableSelect = false;
                    appetizerSelect = false;
                    putinSelect = false;
                    friedChickenSelect = false;
                    hotSandwichSelect = false;
                    bergerSelect = true;
                    hotDogSelect = false;
                    pizzaSelect = false;
                    comboSelect = false;
                  });
                },
                child: Column(
                  children: [
                    bergerSelect != true
                        ? Image.asset(
                            "assets/images/unselected_food_types/unselectedBerger.png",
                            width: Dimensions.width45)
                        : Image.asset(
                            "assets/images/selected_food_types/selectedBerger.png",
                            width: Dimensions.width45),
                    Text("برگر", style: TextStyle(color: Colors.grey[900]))
                  ],
                ),
              ),
              SizedBox(
                width: Dimensions.width45,
              ),
              GestureDetector(
                onTap: () {
                  selectController.iconSelectedRepo.changeIconTypeRepo(
                      "هات داگ", widget.controller, widget.nestedController);
                  setState(() {
                    potableSelect = false;
                    appetizerSelect = false;
                    putinSelect = false;
                    friedChickenSelect = false;
                    hotSandwichSelect = false;
                    bergerSelect = false;
                    hotDogSelect = true;
                    pizzaSelect = false;
                    comboSelect = false;
                  });
                },
                child: Column(
                  children: [
                    hotDogSelect != true
                        ? Image.asset(
                            "assets/images/unselected_food_types/unselectedHotDog.png",
                            width: Dimensions.width45)
                        : Image.asset(
                            "assets/images/selected_food_types/selectedHotDog.png",
                            width: Dimensions.width45),
                    Text("هات داگ", style: TextStyle(color: Colors.grey[900]))
                  ],
                ),
              ),
              SizedBox(
                width: Dimensions.width45,
              ),
              GestureDetector(
                onTap: () {
                  selectController.iconSelectedRepo.changeIconTypeRepo(
                      "پیتزا", widget.controller, widget.nestedController);
                  setState(() {
                    potableSelect = false;
                    appetizerSelect = false;
                    putinSelect = false;
                    friedChickenSelect = false;
                    hotSandwichSelect = false;
                    bergerSelect = false;
                    hotDogSelect = false;
                    pizzaSelect = true;
                    comboSelect = false;
                  });
                },
                child: Column(
                  children: [
                    pizzaSelect != true
                        ? Image.asset(
                            "assets/images/unselected_food_types/unselectedPizza.png",
                            width: Dimensions.width45)
                        : Image.asset(
                            "assets/images/selected_food_types/selectedPizza.png",
                            width: Dimensions.width45),
                    Text("پیتزا", style: TextStyle(color: Colors.grey[900]))
                  ],
                ),
              ),
              SizedBox(
                width: Dimensions.width45,
              ),
              GestureDetector(
                onTap: () {
                  selectController.iconSelectedRepo
                      .changeIconTypeRepo("کمبو", widget.controller, widget.nestedController);
                  setState(() {
                    potableSelect = false;
                    appetizerSelect = false;
                    putinSelect = false;
                    friedChickenSelect = false;
                    hotSandwichSelect = false;
                    bergerSelect = false;
                    hotDogSelect = false;
                    pizzaSelect = false;
                    comboSelect = true;
                  });
                },
                child: Column(
                  children: [
                    comboSelect != true
                        ? Image.asset(
                            "assets/images/unselected_food_types/unselectedCombo.png",
                            width: Dimensions.width45)
                        : Image.asset(
                            "assets/images/selected_food_types/selectedCombo.png",
                            width: Dimensions.width45),
                    Text("کمبو", style: TextStyle(color: Colors.grey[900]))
                  ],
                ),
              ),
            ]);
          })),
    );
  }
}
