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
      controller.jumpTo(Dimensions.height45*10*15+Dimensions.height10*15+Dimensions.height45);
    }

    else if(iconName == "برگر"){
      nestedController.jumpTo(Dimensions.height45*7.2);
      controller.jumpTo(Dimensions.height45*10*18+Dimensions.height10*18+Dimensions.height45*2);
    }

    else if(iconName == "ساندویچ گرم"){
      nestedController.jumpTo(Dimensions.height45*7.2);
      controller.jumpTo(Dimensions.height45*10*25+Dimensions.height10*25+Dimensions.height45*3);
    }

    else if(iconName == "سوخاری"){
      nestedController.jumpTo(Dimensions.height45*7.2);
      controller.jumpTo(Dimensions.height45*10*27+Dimensions.height10*27+Dimensions.height45*4);
    }

    else if(iconName == "پوتین"){
      nestedController.jumpTo(Dimensions.height45*7.2);
      controller.jumpTo(Dimensions.height45*10*31+Dimensions.height10*31+Dimensions.height45*5);
    }

    else if(iconName == "پیش غذا"){
      nestedController.jumpTo(Dimensions.height45*7.2);
      controller.jumpTo(Dimensions.height45*10*33+Dimensions.height10*33+Dimensions.height45*6);
    }

    else if(iconName == "نوشیدنی"){
      nestedController.jumpTo(Dimensions.height45*7.2);
      controller.jumpTo(Dimensions.height45*10*37+Dimensions.height10*37+Dimensions.height45*7);
    }
  }
}