import 'package:flutter/material.dart';
import 'package:restaurant_app/widget/dimensions.dart';

class IconSelectedRepo{

  changeIconTypeRepo(String iconName, ScrollController controller, ScrollController nestedController){
    if(iconName == "کمبو"){
      nestedController.jumpTo(Dimensions.height45*7.2);
      controller.jumpTo(0);
    }
    else if(iconName == "پیتزا"){
      nestedController.jumpTo(Dimensions.height45*7.2);
      controller.jumpTo(Dimensions.height45*46);
    }

    else if(iconName == "هات داگ"){
      nestedController.jumpTo(Dimensions.height45*7.2);
      controller.jumpTo(Dimensions.height45*137);
    }

    else if(iconName == "برگر"){
      nestedController.jumpTo(Dimensions.height45*7.2);
      controller.jumpTo(Dimensions.height45*166);
    }

    else if(iconName == "ساندویچ گرم"){
      nestedController.jumpTo(Dimensions.height45*7.2);
      controller.jumpTo(Dimensions.height45*229);
    }

    else if(iconName == "سوخاری"){
      nestedController.jumpTo(Dimensions.height45*7.2);
      controller.jumpTo(Dimensions.height45*248);
    }

    else if(iconName == "پوتین"){
      nestedController.jumpTo(Dimensions.height45*7.2);
      controller.jumpTo(Dimensions.height45*286);
    }

    else if(iconName == "پیش غذا"){
      nestedController.jumpTo(Dimensions.height45*7.2);
      controller.jumpTo(Dimensions.height45*305.5);
    }

    else if(iconName == "نوشیدنی"){
      nestedController.jumpTo(Dimensions.height45*7.2);
      controller.jumpTo(Dimensions.height45*341);
    }
  }

  String scrollMenuListAfterSelectRepo(String iconName){
    late String selected;

    if(iconName == "کمبو"){
      selected = "comboSelected";
    }
    else if(iconName == "پیتزا"){
      selected = "pizzaSelected";
    }

    else if(iconName == "هات داگ"){
      selected = "hotDogSelected";
    }

    else if(iconName == "برگر"){
      selected = "bergerSelected";
    }

    else if(iconName == "ساندویچ گرم"){
      selected = "hotSandwichSelected";
    }

    else if(iconName == "سوخاری"){
      selected = "firedChickenSelected";
    }

    else if(iconName == "پوتین"){
      selected = "putinSelected";
    }

    else if(iconName == "پیش غذا"){
      selected = "appetizerSelected";
    }

    else if(iconName == "نوشیدنی"){
      selected = "potableSelected";
    }
    print("OOOOOOOOOOOOOOOOOOOOOOOOOOOo   "+selected);
    return selected;
  }
}