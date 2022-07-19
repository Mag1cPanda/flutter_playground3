import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_playground3/page/home/home_page.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_playground3/widget/my_tab_bar.dart';
import 'package:flutter_playground3/page/home/grid_page.dart';
import 'package:flutter_playground3/page/home/lock_page.dart';
import 'package:flutter_playground3/page/home/group_page.dart';
import 'package:flutter_playground3/page/home/card_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final navigatorKey = GlobalKey<NavigatorState>();
    return RefreshConfiguration(
        headerBuilder: () => const ClassicHeader(),
        footerBuilder: () => const ClassicFooter(),
        child: GetMaterialApp(
          navigatorKey: navigatorKey,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.red,

            primaryColor: Colors.green,
          ),

          // builder: EasyLoading.init(),
          home: const CardPage(),
        )
    );
  }
}

