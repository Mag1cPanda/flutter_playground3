import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:flutter_playground3/widget/my_tab_bar.dart';

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
            primarySwatch: Colors.blue,
          ),
          // builder: EasyLoading.init(),
          home: const MyTabBar(),
        )
    );
  }
}

