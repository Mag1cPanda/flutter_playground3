import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_playground3/page/home/group_page.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class LockPage extends StatefulWidget {
  const LockPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LockPageState();
  }
}

class _LockPageState extends State<LockPage> {
  final List<String> days = <String>[
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  final List<String> months = <String>[
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  int hour = 0;
  int minute = 0;
  int day = 0;
  int month = 0;
  int dayInMonth = 0;
  late Timer _timer;

  void _refreshTime() {
    final DateTime time = DateTime.now();
    hour = time.hour;
    minute = time.minute;
    day = time.weekday;
    month = time.month;
    dayInMonth = time.day;
  }

  @override
  void initState() {
    _refreshTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _refreshTime();
      setState(() {

      });
    });

    super.initState();
  }

  @override
  void dispose() {
    ///取消计时器
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Slide To Unlock'),
      // ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            // 'assets/images/modern/b43.jpg',
            // 'assets/images/tradition/d20.jpg',
            // 'assets/images/western/c40.jpg',
            // 'assets/images/background.jpeg',
            'assets/images/lock_image.jpg',
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 48.0,
            right: 0.0,
            left: 0.0,
            child: Center(
              child: Column(
                children: <Widget>[
                  Text(
                    '${hour < 10 ? '0$hour' : '$hour'}:${minute < 10 ? '0$minute' : '$minute'}',
                    style: const TextStyle(
                      fontSize: 60.0,
                      color: Colors.white,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                  ),
                  Text(
                    '${days[day - 1]}, ${months[month - 1]} $dayInMonth',
                    style: const TextStyle(fontSize: 24.0, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 24.0,
              left: 0.0,
              right: 0.0,
              child: GestureDetector(
                onPanDown: (DragDownDetails e) {
                  // print(e.globalPosition);
                  print('onPanDown');
                },
                onPanStart: (DragStartDetails e) {
                  // print(e.globalPosition);
                  print('onPanStart');
                },
                onPanUpdate: (DragUpdateDetails e) {
                  print(e.localPosition);
                },
                onPanEnd: (DragEndDetails e) {
                  print('onPanEnd');
                  // print(e);
                  // print(e.primaryVelocity);
                  Get.offAll(const GroupPage());
                },
                onPanCancel: () {
                  print('onPanCancel');
                },
                onTap: () {},
                child: Center(
                  child: Opacity(
                    opacity: 0.8,
                    child: Shimmer.fromColors(
                      baseColor: Colors.black12,
                      highlightColor: Colors.white,
                      loop: 0,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/chevron_right.png',
                            height: 20.0,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.0),
                          ),
                          const Text(
                            // 'Slide to unlock',
                            '滑动解锁',
                            style: TextStyle(
                              fontSize: 28.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
