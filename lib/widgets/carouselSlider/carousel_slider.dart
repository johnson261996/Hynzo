
///Carousel slider widget created for home screen

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hynzo/resources/images.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({Key? key}) : super(key: key);

  @override
  _CarouselSliderWidgetState createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      CarouselSlider(
          items: Images.CAROUSELIMAGES.map((image){
            return Builder(
              builder: (BuildContext context) {
                return Container(
                margin: EdgeInsets.zero,
                    decoration: BoxDecoration(color: Colors.white),
                    child: GestureDetector(
                        child: Image.asset(image),
                        onTap: null));
              },
            );
          }).toList(),
          options: CarouselOptions(
            height: 400,
           viewportFraction: 0.88,
            initialPage: 0,
            enableInfiniteScroll: false,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds:2),
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          )
      ),

    );
  }
}
