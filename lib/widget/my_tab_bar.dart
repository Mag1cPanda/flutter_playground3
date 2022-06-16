import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:flutter_playground3/common/app_colors.dart';
import 'package:flutter_playground3/page/home/home_page.dart';
import 'package:flutter_playground3/page/discover/discover_page.dart';
import 'package:flutter_playground3/page/mine/mine_page.dart';


class MyTabBar extends StatefulWidget {
  const MyTabBar({Key? key}) : super(key: key);

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  int _tabIndex = 0;

  late List<BottomNavigationBarItem> _navigationViews;

  List<String> appBarTitles = ['首页', '发现', '我的'];

  Widget? _body;

  @override
  void initState() {
    super.initState();

    _navigationViews = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: const Icon(Icons.home),
        activeIcon: const Icon(Icons.home),
        label: appBarTitles[0],
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.wifi_tethering),
        activeIcon: const Icon(Icons.wifi_tethering),
        label: appBarTitles[1],
        // backgroundColor: AppColors.colorPrimary,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.person),
        activeIcon: const Icon(Icons.person),
        label: appBarTitles[2],
        // backgroundColor: AppColors.colorPrimary,
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    _body = IndexedStack(
      index: _tabIndex,
      children: const <Widget>[HomePage(), DiscoverPage(), MinePage()],
    );

    return Scaffold(
      body: _body,
      bottomNavigationBar: BottomNavigationBar(
        items: _navigationViews
            .map((BottomNavigationBarItem navigationView) => navigationView)
            .toList(),
        currentIndex: _tabIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        unselectedItemColor: AppColors.colorTextTitle,
        selectedItemColor: AppColors.colorPrimary,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }
}