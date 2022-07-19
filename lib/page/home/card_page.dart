import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  Widget _buildCard() {
    List imageList = ['a1', 'a2', 'a4', 'a6', 'a7'];
    return CarouselSlider(
      options: CarouselOptions(
          height: 400,
        aspectRatio: 16/9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.easeInOutCubic,
        enlargeCenterPage: true,
        onPageChanged: (index, reason) {
            print(index);
            print(reason);
        },
        scrollDirection: Axis.horizontal,
      ),
      items: imageList.map((item) {
        return Builder(
          builder: (BuildContext context) {
            String imagePath = "assets/images/$item.jpg";
            return GestureDetector(
              onTap: () {
                print(item);
              },
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  )
              ),
            );
          },
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("路由没有找到"),
      ),
      body: Center(
        child: _buildCard()
      ),
    );
  }

}