import 'dart:io';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

import 'grid_detail.dart';



class GridPage extends StatelessWidget {
  const GridPage({Key? key}) : super(key: key);

  static const pattern = [
    QuiltedGridTile(2, 2),
    QuiltedGridTile(1, 1),
    QuiltedGridTile(1, 1),
    QuiltedGridTile(1, 2),
  ];

  Future<File> testCompressAndGetFile(File file, String targetPath) async {
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path, targetPath,
      quality: 50,
    );

    print(file.lengthSync());
    print(result!.lengthSync());

    return result;
  }

  Widget _buildImage(int index) {
    imageCache.maximumSize = 10;
    String imageUrl = 'https://jhz-1254461030.cos.ap-nanjing.myqcloud.com/index${index+1}.jpg';

    // Random random = Random.secure();
    // int xPart = random.nextInt(4)+1; //0-99999
    // int yPart = random.nextInt(4)+1; //0-99999
    // print(xPart);
    // print(yPart);
    // String imagePath = "assets/images/index60.jpg";
    String imagePath = "assets/images/index${index+1}.jpg";

    // CachedNetworkImage(
    //   filterQuality: FilterQuality.high,
    //   memCacheWidth: 200,
    //   memCacheHeight: 200,
    //   imageUrl: imageUrl,
    //   fit: BoxFit.contain,
    //   // placeholder: (context, url) => const CircularProgressIndicator(),
    //   progressIndicatorBuilder: (context, url, downloadProgress) =>
    //       CircularProgressIndicator(value: downloadProgress.progress),
    //   errorWidget: (context, url, error) => const Icon(Icons.error),
    // )


    return GestureDetector(
      onTap: () {
        Get.to(() => GridDetail(imagePath));
      },
      child: Image.asset(imagePath, fit: BoxFit.fitHeight, cacheWidth: 500, cacheHeight: 500,)
    );

  }

  Widget _buildGrid() {
    List tmpList = [];
    for (var i=0; i<81; i++) {
      tmpList.add(i);
    }
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      childAspectRatio: 1,
      children: tmpList.map((index) => _buildImage(index)).toList(),
    );
    return GridView.custom(

      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: pattern,
      ),
      childrenDelegate: SliverChildBuilderDelegate(
            (context, index) => _buildImage(index),
        childCount: 81,
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Grid"),
        ),
        body: _buildGrid());
  }
}

const _defaultColor = Color(0xFF34568B);

class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    required this.index,
    this.extent,
    this.backgroundColor,
    this.bottomSpace,
  }) : super(key: key);

  final int index;
  final double? extent;
  final double? bottomSpace;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final child = Container(
      color: backgroundColor ?? _defaultColor,
      height: extent,
      child: Center(
        child: CircleAvatar(
          minRadius: 20,
          maxRadius: 20,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          child: Text('$index', style: const TextStyle(fontSize: 20)),
        ),
      ),
    );

    if (bottomSpace == null) {
      return child;
    }

    return Column(
      children: [
        Expanded(child: child),
        Container(
          height: bottomSpace,
          color: Colors.green,
        )
      ],
    );
  }
}
