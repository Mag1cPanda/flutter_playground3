import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class GridDetail extends StatelessWidget {
  const GridDetail(this.imagePath, {Key? key}) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("P&Z"),
      ),
      body: PhotoView(
        backgroundDecoration: const BoxDecoration(
            color: Colors.white
        ),
        imageProvider: AssetImage(imagePath),
      ),
    );
  }

}