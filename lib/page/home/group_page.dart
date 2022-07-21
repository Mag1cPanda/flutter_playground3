import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math';
import 'package:get/get.dart';
import 'package:nine_grid_view/nine_grid_view.dart';

import 'grid_detail.dart';
import 'card_page.dart';
import 'package:flutter_playground3/common/custom_route.dart';
import 'package:flutter_playground3/common/constant.dart';
// import '../../common/custom_route.dart';



class GroupPage extends StatelessWidget {
  const GroupPage({Key? key}) : super(key: key);

  List<Color> _getColorPair() {
    List colorPairs = const [
      [Color(0xFFF387BC), Color(0xFFEFB899)],
      [Color(0xFFF387BC), Color(0xFFA28FED)],
      [Color(0xFF62A8FD), Color(0xFFA28FED)],
      [Color(0xFF62A8FD), Color(0xFF9E80F3)],
      [Color(0xFFF9BF66), Color(0xFFF95C81)],
      [Color(0xFFb6b7f8), Color(0xFFF95C81)],
      [Color(0xFFb6b7f8), Color(0xFFF5ACCC)],
      [Color(0xFFFFE35A), Color(0xFFF5ACCC)],
      [Color(0xFFFD9788), Color(0xFFF5ACCC)],
      [Color(0xFFFD9788), Color(0xFFF567DC)],
      [Color(0xFFA2ACF1), Color(0xFFF567DC)],
      [Color(0xFFF25555), Color(0xFFF567DC)],
      [Color(0xFFF25555), Color(0xFFFB72A1)],
    ];

    int index = Random().nextInt(colorPairs.length);
    return colorPairs[index];
  }

  Widget _buildGroup(BuildContext ctx, PhotoType type) {
    final ratio = window.devicePixelRatio;
    final width = window.physicalSize.width / ratio;
    final size = (width - 30) / 2;

    List<Color> pair = _getColorPair();
    List imageList = [];
    String category = '';
    if (type == PhotoType.forest) {
      imageList = ['a1', 'a2', 'a4', 'a6', 'a7'];
      category = 'forest';
    } else if (type == PhotoType.modern) {
      imageList = ['b1', 'b2', 'b3', 'b9', 'b11'];
      category = 'modern';
    } else if (type == PhotoType.tradition) {
      imageList = ['d1', 'd6', 'd7', 'd9', 'd14'];
      category = 'tradition';
    } else if (type == PhotoType.western) {
      imageList = ['c1', 'c3', 'c4', 'c6', 'c7'];
      category = 'western';
    }

    return GestureDetector(
        onTap: () {
          // Navigator.push(ctx, CustomRoute(CardPage(type: type)));
          Get.to(() => CardPage(type: type, title: category,));
          // print(width);
        },
        child: NineGridView(
          width: size,
          height: size,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0.0, 1.0],
                colors: pair),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.all(10),
          space: 10,
          type: NineGridType.qqGp,
          //NineGridType.weChatGp, NineGridType.dingTalkGp
          itemCount: imageList.length,
          itemBuilder: (BuildContext context, int index) {
            String imagePath = "assets/images/$category/${imageList[index]}.jpg";
            return Image.asset(
              imagePath,
              fit: BoxFit.cover,
            );
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFFF25555),
        title: const Text("P·Z"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Wrap(
          spacing: 5,
          runSpacing: 5,
          children: [
            _buildGroup(context, PhotoType.forest),
            _buildGroup(context, PhotoType.modern),
            _buildGroup(context, PhotoType.tradition),
            _buildGroup(context, PhotoType.western),
          ],
        ),
      ),
    );
  }
}
