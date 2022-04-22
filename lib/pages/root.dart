import 'package:flutter/material.dart';
import 'package:real_estate/pages/explore.dart';
import 'package:real_estate/pages/homes.dart';
import 'package:real_estate/pages/motors.dart';
import 'package:real_estate/theme/color.dart';
import 'package:real_estate/widgets/bottombar_item.dart';

import 'home_page.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;
  List barItems = [
    {
      "icon": Icons.home_outlined,
      "active_icon": Icons.home_rounded,
      "page": Homes(),
      "title": ""
    },
    {
      "icon": Icons.car_rental,
      "active_icon": Icons.car_rental_outlined,
      "page": ExplorePage(),
      "title": ""
    },
    {
      "icon": Icons.motorcycle,
      "active_icon": Icons.motorcycle_outlined,
      "page": MotorsPage(),
      "title": ""
    },
    {
      "icon": Icons.chair,
      "active_icon": Icons.chair_outlined,
      "page": HomePage(),
      "title": ""
    },
    {
      "icon": Icons.settings_outlined,
      "active_icon": Icons.settings_rounded,
      "page": HomePage(),
      "title": ""
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: getBarPage(),
      // bottomNavigationBar: getBottomBar1()
      floatingActionButton: getBottomBar(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  Widget getBarPage() {
    return IndexedStack(
        index: activeTab,
        children:
            List.generate(barItems.length, (index) => barItems[index]["page"]));
  }

  Widget getBottomBar() {
    return Container(
      height: 55,
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
      decoration: BoxDecoration(
          color: bottomBarColor,
          borderRadius: BorderRadius.circular(20),
          // borderRadius: BorderRadius.only(
          //   topLeft: Radius.circular(20),
          //   topRight: Radius.circular(20)
          // ),
          boxShadow: [
            BoxShadow(
                color: shadowColor.withOpacity(0.1),
                blurRadius: 1,
                spreadRadius: 1,
                offset: Offset(0, 1))
          ]),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.generate(
              barItems.length,
              (index) => BottomBarItem(
                    activeTab == index
                        ? barItems[index]["active_icon"]
                        : barItems[index]["icon"],
                    "",
                    isActive: activeTab == index,
                    activeColor: primary,
                    onTap: () {
                      setState(() {
                        activeTab = index;
                      });
                    },
                  ))),
    );
  }
}
