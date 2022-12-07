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
      controller.jumpTo(Dimensions.height45*10*5+Dimensions.height10*5);
    }

    else if(iconName == "هات داگ"){
      nestedController.jumpTo(Dimensions.height45*7.2);
      controller.jumpTo(Dimensions.height45*10*14+Dimensions.height10*9);
    }

    else if(iconName == "برگر"){
      nestedController.jumpTo(Dimensions.height45*7.2);
      controller.jumpTo(Dimensions.height45*10*17+Dimensions.height10);
    }

    else if(iconName == "ساندویچ گرم"){
      nestedController.jumpTo(Dimensions.height45*7.2);
      controller.jumpTo(Dimensions.height45*10*23+Dimensions.height10*10);
    }

    else if(iconName == "سوخاری"){
      nestedController.jumpTo(Dimensions.height45*7.2);
      controller.jumpTo(Dimensions.height45*10*25+Dimensions.height10*10);
    }

    else if(iconName == "پوتین"){
      nestedController.jumpTo(Dimensions.height45*7.2);
      controller.jumpTo(Dimensions.height45*10*28+Dimensions.height10*40);
    }

    else if(iconName == "پیش غذا"){
      nestedController.jumpTo(Dimensions.height45*7.2);
      controller.jumpTo(Dimensions.height45*10*30+Dimensions.height10*38);
    }

    else if(iconName == "نوشیدنی"){
      nestedController.jumpTo(Dimensions.height45*7.2);
      controller.jumpTo(Dimensions.height45*10*34+Dimensions.height10*20);
    }
  }
}