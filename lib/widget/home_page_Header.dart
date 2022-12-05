import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:restaurant_app/controller/branch_controller.dart';
import 'package:restaurant_app/widget/branch_dialog_box.dart';
import 'package:restaurant_app/widget/dimensions.dart';

class HomePageHeader extends StatefulWidget {

  final AnimationController animationController;
  final String branch;
  final String branchAddress;

  const HomePageHeader({Key? key, required this.animationController, required this.branch, required this.branchAddress}) : super(key: key);

  @override
  State<HomePageHeader> createState() => _HomePageHeaderState(animationController, branch, branchAddress);
}

class _HomePageHeaderState extends State<HomePageHeader> {

  AnimationController animationController;
  String branch;
  String branchAddress;

  var nowTime = DateTime.now();

  _HomePageHeaderState(this.animationController, this.branch, this.branchAddress);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: Dimensions.height45*5.5,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    opacity: 0.5,
                    image: AssetImage(
                        "assets/images/headerImage.jpg"
                    )
                )
            ),
          ),
          GetBuilder<BranchController>(builder: (branchController){

            return Center(
              child: Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20
                ),
                child: Column(
                  children: [
                    SizedBox(height: Dimensions.height20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(branchController.name.isEmpty ? "ونک" : branchController.name,
                          style: PersianFonts.Sahel.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 28),),
                        Text(" شعبه",
                          style: PersianFonts.Sahel.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 28),),
                      ],
                    ),
                    SizedBox(height: Dimensions.height10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(branchController.address.isEmpty ? "ضلع جنوب شرقی میدان ونک" : branchController.address,
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.justify,
                            style: PersianFonts.Sahel.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),),
                        ),
                        Text("آدرس: ",
                          textDirection: TextDirection.rtl,
                          style: PersianFonts.Sahel.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),),
                      ],
                    ),
                    SizedBox(height: Dimensions.height20,),
                    BranchDialogBox(branch: widget.branch, branchAddress: widget.branchAddress,),
                    SizedBox(height: Dimensions.height30,),
                    nowTime.hour >= 11
                        ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text('سفارش می پذیریم',
                            style: PersianFonts.Samim.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w200,
                                fontSize: 15)),
                        SizedBox(width: Dimensions.width10,),
                        FadeTransition(
                            opacity: widget.animationController,
                            child: Container(
                              width: Dimensions.width30/2,
                              height: Dimensions.height30/2,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green
                              ),
                            ))
                      ],
                    )
                        : Center(
                      child: Text("شروع سفارش گیری از ساعت 11:00:00 امروز",
                          style: PersianFonts.Samim.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w200,
                              fontSize: 15)),
                    )

                  ],
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
