import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/controller/branch_controller.dart';
import 'package:restaurant_app/widget/dimensions.dart';

class FirstTabBar extends StatelessWidget {
  const FirstTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List weekList = ["شنبه","یکشنبه","دوشنبه","سه شنبه","چهارشنبه","پنج شنبه","جمعه"];
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: Dimensions.height30,),
          Text("سرویس دهی آنلاین",
          style: TextStyle(
            color: Colors.deepOrange[500],
            fontWeight: FontWeight.w700,
            fontSize: Dimensions.font20
          ),),
          SizedBox(height: Dimensions.height30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("شام",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: Dimensions.font16
                ),),
              SizedBox(width: Dimensions.width45,),
              Text("ناهار",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: Dimensions.font16
                ),),
              SizedBox(width: Dimensions.width45,),
              Text("صبحانه",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: Dimensions.font16
                ),),
            ],
          ),
          SizedBox(height: Dimensions.height30,),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: weekList.length,
            itemBuilder: (context, index){
              return Padding(
                  padding: EdgeInsets.only(
                      right: Dimensions.width20,
                      bottom: Dimensions.height30*2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: const [
                          Text("18:00 تا ",
                              textDirection: TextDirection.rtl),
                          Text("23:29"),
                        ],
                      ),
                      SizedBox(width: Dimensions.width30),
                      Column(
                        children: const [
                          Text("11:00 تا ",
                              textDirection: TextDirection.rtl),
                          Text("18:00"),
                        ],
                      ),
                      SizedBox(width: Dimensions.width30*2),
                      Text("-"),
                      SizedBox(width: Dimensions.width20),
                      Container(
                        alignment: Alignment.centerRight,
                        width: Dimensions.width20*4,
                        child: Text(weekList[index],
                          style: TextStyle(
                            fontSize: Dimensions.font20,
                          ),),
                      ),
                    ],
                  ));
            },
          ),
          SizedBox(height: Dimensions.height10/2,),
          Text('نوع غذا',
              style: TextStyle(
                  color: Colors.deepOrange[500],
                  fontWeight: FontWeight.w700,
                  fontSize: Dimensions.font20
              )),
          SizedBox(height: Dimensions.height20,),
          Container(
            margin: EdgeInsets.only(
              right: Dimensions.width20*3,
              left: Dimensions.width20*3,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("ساندویچ",
                  style: TextStyle(
                    fontSize: Dimensions.font20,
                  ),),
                Text("پپتزا",
                  style: TextStyle(
                    fontSize: Dimensions.font20,
                  ),),
                Text("فست فود",
                  style: TextStyle(
                    fontSize: Dimensions.font20,
                  ),)
              ],
            ),
          ),
          SizedBox(height: Dimensions.height45,),
          Text('آدرس رستوزان',
              style: TextStyle(
                  color: Colors.deepOrange[500],
                  fontWeight: FontWeight.w700,
                  fontSize: Dimensions.font20
              )),
          SizedBox(height: Dimensions.height10,),
          Container(
            margin: EdgeInsets.only(
              right: Dimensions.width30,
              left: Dimensions.width30,
            ),
            child: Text(Get.find<BranchController>().address,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: Dimensions.font20,
              ),),
          ),
        ],
      ),
    );
  }
}
