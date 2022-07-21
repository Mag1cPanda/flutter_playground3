import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_playground3/page/home/group_page.dart';

import '../../common/custom_route.dart';
import 'grid_detail.dart';

import 'package:flutter_playground3/common/constant.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key, required this.title, required this.type})
      : super(key: key);
  final String title;
  final PhotoType type;

  @override
  State<StatefulWidget> createState() {
    return _CardPageState();
  }
}

class _CardPageState extends State<CardPage> {
  List imageList = [];
  String category = '';
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    if (widget.type == PhotoType.forest) {
      imageList = ['a1', 'a2', 'a4', 'a6', 'a7'];
      category = 'forest';
    } else if (widget.type == PhotoType.modern) {
      imageList = ['b1', 'b2', 'b3', 'b9', 'b11'];
      category = 'modern';
    } else if (widget.type == PhotoType.tradition) {
      imageList = ['d1', 'd6', 'd7', 'd9', 'd14'];
      category = 'tradition';
    } else if (widget.type == PhotoType.western) {
      imageList = ['c1', 'c3', 'c4', 'c6', 'c7'];
      category = 'western';
    }

    super.initState();
  }

  Widget _buildCard() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastLinearToSlowEaseIn,
        enlargeCenterPage: true,
        onPageChanged: (index, reason) {
          print(index);
          setState(() {
            _current = index;
          });
          // print(reason);
        },
        scrollDirection: Axis.horizontal,
      ),
      items: imageList.map((item) {
        return Builder(
          builder: (BuildContext context) {
            String imagePath = "assets/images/$category/$item.jpg";
            return GestureDetector(
              onTap: () {
                print(item);
                Navigator.push(context, CustomRoute(GridDetail(imagePath)));
              },
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  )),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: imageList.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () => _controller.animateToPage(entry.key),
          child: Container(
            width: 12.0,
            height: 12.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black)
                    .withOpacity(_current == entry.key ? 0.9 : 0.4)),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFFF25555),
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildCard(),
            // _buildIndicator()
          ],
      ),
    );
  }
}
