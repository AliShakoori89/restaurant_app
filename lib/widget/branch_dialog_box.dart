import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/controller/branch_controller.dart';
import 'package:restaurant_app/widget/dimensions.dart';

class BranchDialogBox extends StatefulWidget {
  String? branch;
  String? branchAddress;
  var reserveTime = DateTime.now();
  BranchDialogBox({Key? key, required this.branch, required this.branchAddress}) : super(key: key);

  @override
  State<BranchDialogBox> createState() => _BranchDialogBoxState(branch, branchAddress);
}

class _BranchDialogBoxState extends State<BranchDialogBox> {

  List allBranches = [];

  _BranchDialogBoxState(branch,branchAddress);

  get _fireStoreInstance => FirebaseFirestore.instance;

  fetchRestaurantBranches() async{

    QuerySnapshot qn = await _fireStoreInstance.collection('all branch').get();
    setState(() {
      for(int i = 0; i<qn.docs.length; i++){
        allBranches.add(
            {
              "branch-name": qn.docs[i]["branch-name"],
              "branch-address": qn.docs[i]["branch-address"]
            }
        );
      }
    });
    return qn.docs;
  }

  @override
  void initState() {
    fetchRestaurantBranches();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    ScrollController scrollController = ScrollController(
      initialScrollOffset: 300, // or whatever offset you wish
      keepScrollOffset: false,
    );

    AlertDialog alert = AlertDialog(

      title: const Text("لطفا شعبه مورد نظر خود را انتخاب کنید",
      textAlign: TextAlign.right,
      style: TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 17
      )),
      content: Builder(
        builder: (context) {
          // Get available height and width of the build area of this widget. Make a choice depending on the size.
          var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;

          return SizedBox(
            height: height,
            width: width,
            child: Column(
              children: [
                const Divider(
                  color: Colors.grey,
                ),
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    reverse: true,
                    itemExtent: Dimensions.height30,
                    padding: EdgeInsets.only(top: Dimensions.height20),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: allBranches.length,
                    itemBuilder: (context, index){
                      return GestureDetector(
                        onTap: (){
                          Get.find<BranchController>().setBranch(
                              allBranches[index]["branch-name"],
                              allBranches[index]["branch-address"]);
                          Get.find<BranchController>().getBranchName();
                          Get.find<BranchController>().getBranchAddress();
                          Get.back();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(allBranches[index]["branch-name"],
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700
                            ),),
                            SizedBox(width: Dimensions.width10,),
                            Icon(Icons.location_on_outlined,
                            color: Colors.grey.shade300,)
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );

    return GestureDetector(
      onTap: (){
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );
      },
      child: Container(
        width: Dimensions.width30*4,
        height: Dimensions.height20*2,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: Dimensions.width10/2,),
              const Icon(Icons.keyboard_arrow_down_sharp,color: Colors.black),
              const Text("تغییر شعبه",
                style: TextStyle(color: Colors.black,
                    fontWeight: FontWeight.w700),),
              SizedBox(width: Dimensions.width10/2,),
            ],
          ),
        ),
      ),
    );
  }
}
