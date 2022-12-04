import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/controller/branch_controller.dart';
import 'package:restaurant_app/pages/auth/login_page.dart';
import 'package:restaurant_app/widget/all_food_types/combo_food_menu.dart';
import 'package:restaurant_app/widget/branch_dialog_box.dart';
import 'package:restaurant_app/widget/menu_icons.dart';
import 'package:restaurant_app/widget/search_text_field.dart';
import 'package:restaurant_app/widget/dimensions.dart';
import 'package:persian_fonts/persian_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{

  late AnimationController _animationController;
  late TabController _tabController;
  var searchController = TextEditingController();
  ScrollController scrollBarController = ScrollController();
  var reserveTime = DateTime.now();
  final String branch = '';
  final String branchAddress = '';
  late bool fixedScroll;
  late ScrollController _scrollController;
  String selected = '';

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: 1);
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    // _tabController.addListener(_smoothScrollToTop);
    _animationController =
    AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController.repeat(reverse: true);
    super.initState();
  }

  // _smoothScrollToTop() {
  //   _scrollController.animateTo(
  //     0,
  //     duration: Duration(microseconds: 300),
  //     curve: Curves.ease,
  //   );
  //
  //   setState(() {
  //     fixedScroll = _tabController.index == 2;
  //   });
  // }

  _scrollListener() {
    if (fixedScroll) {
      _scrollController.jumpTo(0);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _scrollController.dispose();
    _animationController.dispose();
  }

  final List<Widget> myTabs = [
    Container(
      width: Dimensions.screenWidth/2,
        child: Tab(text: 'اطلاعات رستوران')),
    Container(
        width: Dimensions.screenWidth/2,
        child: Tab(text: 'منوی سفارش')),
  ];

  Widget _buildCarousel() {
    return Column(
      children: [
        Container(
          color: Colors.black,
          child: Padding(
            padding: EdgeInsets.only(
                top: Dimensions.height15,
                right: Dimensions.width10,
                left: Dimensions.width10,
                bottom: Dimensions.height15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        fullscreenDialog: true,
                        builder: (context) {
                          return const LoginPage();
                        },
                      ),
                    );
                  },
                  child: Container(
                    width: Dimensions.width45*3,
                    height: Dimensions.height15*3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 1, color: Colors.deepOrange)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: Dimensions.width10*0.05,),
                        const Text("ورود / عضویت", style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold),),
                        const Icon(Icons.person_outline_outlined, color: Colors.white,),
                        SizedBox(width: Dimensions.width10*0.05,),
                      ],
                    ),
                  ),
                ),
                Image.asset("assets/images/logo.png",
                  width: Dimensions.height45,),
              ],
            ),
          ),
        ),
        Container(
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
                        BranchDialogBox(branch: branch, branchAddress: branchAddress,),
                        SizedBox(height: Dimensions.height30,),
                        reserveTime.hour >= 11
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
                                opacity: _animationController,
                                child: Container(
                                  width: Dimensions.width30/2,
                                  height: Dimensions.height30/2,
                                  decoration: BoxDecoration(
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
        ),
        SizedBox(height: Dimensions.height10,),
        // tab bar view here
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    print(reserveTime.hour);
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (context, value) {
              return [
                SliverToBoxAdapter(child: _buildCarousel()),
                SliverToBoxAdapter(
                  child: TabBar(
                      isScrollable: true,
                      controller: _tabController,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w700
                      ),
                      // give the indicator a decoration (color and border radius)
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey[500],
                      indicatorColor: Colors.grey[500],
                      tabs: myTabs
                  ),
                ),
              ];
            },
            body: TabBarView(
                controller: _tabController,
                children:[
                  // first tab bar view widget
                  const Center(
                    child: Text(
                      'Place Bid',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  // second tab bar view widget
                  Column(
                    children: [
                      MenuIcons(controller: scrollBarController, nestedController: _scrollController, selected: selected),
                      const Divider(
                        color: Colors.grey,
                      ),
                      SizedBox(height: Dimensions.height10/2,),
                      SearchTextField(
                        textController: searchController,
                        hintText: "جستجوی سریع",
                        icon: Icons.search_sharp,
                        isObscure: false,
                      ),
                      SizedBox(height: Dimensions.height10/2,),
                      const Divider(
                        color: Colors.grey,
                      ),
                      Expanded(child: ComboFoodMenu(controller: scrollBarController,)),
                    ],
                  )
                ])

          // child: TabBar(
          //   isScrollable: true,
          //   controller: _tabController,
          //   // give the indicator a decoration (color and border radius)
          //   labelColor: Colors.black,
          //   unselectedLabelColor: Colors.grey[500],
          //   indicatorColor: Colors.grey[500],
          //   tabs: [
          //     // first tab [you can add an icon using the icon property]
          //     Tab(
          //       child: Text('اطلاعات رستوران',
          //         style: TextStyle(
          //             fontWeight: FontWeight.w300,
          //         fontSize: Dimensions.font16),
          //       ),
          //     ),
          //
          //     // second tab [you can add an icon using the icon property]
          //     Tab(
          //       child: Text('منوی سفارش',
          //         style: TextStyle(
          //             fontWeight: FontWeight.w300,
          //         fontSize: Dimensions.font16),
          //       ),
          //     ),
          //   ],
          // ),
        )
      ),
    );
  }
}
