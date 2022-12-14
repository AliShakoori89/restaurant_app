import 'package:flutter/material.dart';
import 'package:restaurant_app/pages/home/tab_bar/first_tab/first_tab_bar.dart';
import 'package:restaurant_app/pages/home/tab_bar/second_tab/secound_tab_bar.dart';
import 'package:restaurant_app/widget/home_page_Header.dart';
import 'package:restaurant_app/widget/home_page_app_bar.dart';
import 'package:restaurant_app/widget/dimensions.dart';

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
  final String branch = '';
  final String branchAddress = '';
  bool? fixedScroll;
  late ScrollController _scrollController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: 1);
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _animationController =
    AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController.repeat(reverse: true);
    super.initState();
  }

  _scrollListener() {
    var s = fixedScroll;
    if (s != null) {
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
    SizedBox(
      width: Dimensions.screenWidth/2,
        child: const Tab(text: 'اطلاعات رستوران')),
    SizedBox(
        width: Dimensions.screenWidth/2,
        child: const Tab(text: 'منوی سفارش')),
  ];

  Widget _buildCarousel() {
    return Column(
      children: [
        const HomePageAppBar(),
        HomePageHeader(animationController: _animationController, branch: branch, branchAddress: branchAddress,),
        SizedBox(height: Dimensions.height10,),
        // tab bar view here
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

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
                      labelStyle: const TextStyle(
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
                  const FirstTabBar(),
                  // second tab bar view widget
                  SecondTabBar(scrollBarController: scrollBarController, nestedController: _scrollController, searchController: searchController),
                ])
        )
      ),
    );
  }
}
