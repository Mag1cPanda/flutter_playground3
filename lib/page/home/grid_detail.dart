import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class GridDetail extends StatelessWidget {
  const GridDetail(this.imagePath, {Key? key}) : super(key: key);

  final String imagePath;

  Widget _buildPhoto() {
    return PhotoView.customChild(
        enableRotation: true,
        backgroundDecoration: const BoxDecoration(color: Colors.white),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imagePath,
            fit: BoxFit.fitWidth,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xFFF25555),
          title: const Text("P·Z"),
        ),
        body: _buildPhoto());
  }
}
