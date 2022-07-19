import 'package:flutter/material.dart';
import 'package:flutter_playground3/page/other/not_found_page.dart';

import 'package:get/get.dart';

import 'grid_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final List<String> _demoNameList = ['CustomScrollView', 'LoadMore&Refresh', 'GroupList', 'Dialog', 'Loading'];
  List<String> _demoNameList = [];
  final List<dynamic> _demoPageList = [];
  final Map<String, dynamic> _demos = {
    'CustomScrollView': const NotFoundPage(),
    'Refresh': const NotFoundPage(),
    'GroupList': const NotFoundPage(),
    'Dialog': const NotFoundPage(),
    'Loading': const NotFoundPage(),
    'ExpandList': const NotFoundPage(),
    'Picker': const NotFoundPage(),
    'Grid': const GridPage(),
  };
  late ScrollController _controller;

  void _clickAdd() {
    setState(() {

    });

  }

  void _toDemoPage(index) {
    var demoName = _demoNameList[index];
    Widget page = _demos[demoName];
    Get.to(page);
    // if (_demos[demoName]) {
    //   Get.to(_demos[demoName]);
    // } else {
    //   Get.toNamed(AppRoutes.notFound);
    // }
  }

  @override
  void initState() {
    _controller = ScrollController();
    for(var i=0; i<100; i++) {
      _demos.putIfAbsent('待添加$i', () => const NotFoundPage());
    }
    _demoNameList = _demos.keys.toList();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Playground'),
        actions: [
          IconButton(onPressed: () {
            _clickAdd();
          }, icon: const Icon(Icons.add))
        ],
      ),
      body: Scrollbar(
          child: ListView.separated(
            itemCount: _demoNameList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  _toDemoPage(index);
                },
                title: Text(_demoNameList[index]),
              );
            },
            separatorBuilder:  (BuildContext context, int index) {
              return const Divider(color: Colors.grey);
            },

          )
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'home',
        onPressed: _clickAdd,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}