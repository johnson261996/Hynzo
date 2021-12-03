import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hynzo/core/models/news_home_model.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class NewsSwipeView extends StatefulWidget {
  final List<NewsContentDataModel>? allContent;

  NewsSwipeView({
    Key? key,
    this.allContent,
  }) : super(key: key);

  @override
  State<NewsSwipeView> createState() => _NewsSwipeViewState();
}

class _NewsSwipeViewState extends State<NewsSwipeView> {
  int selectedIndex = 0;
  bool _isLoading=false;
  int index=0;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          bottom: 10.0,
        ),
        child: Dismissible(
                key: Key(selectedIndex.toString()),
                direction: selectedIndex > 0
                    ? DismissDirection.vertical
                    : DismissDirection.up,
                onDismissed: (direction) {
                  //print(direction == DismissDirection.up);
                  if (direction == DismissDirection.down) {
                    if (selectedIndex > 0) {
                      setState(() {
                        selectedIndex--;
                      });
                    }
                  } else {
                    if (selectedIndex < widget.allContent!.length) {
                      setState(() {
                        _isLoading=true;
                        selectedIndex++;
                        Timer(Duration(seconds: 1), () {
                          _isLoading=false;
                        });
                      });
                    }
                  }
                },
                child: _isLoading ? Center(child: CircularProgressIndicator(),) : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: mediaQuery.height * 0.01,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Image.network(
                        widget.allContent![selectedIndex].imageUrl!,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) => Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.black,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: mediaQuery.height * 0.25,
                          child: Center(
                            child: Text(
                              'No image available',
                              style: Theme.of(context).textTheme.headline6!.apply(
                                    color: AppColors.black,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mediaQuery.height * 0.03,
                    ),
                    Text(
                      widget.allContent![selectedIndex].title!,
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 27,
                            color: AppColors.black,
                          ),
                    ),
                    SizedBox(
                      height: mediaQuery.height * 0.02,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          widget.allContent![selectedIndex].description!.replaceAll("‘", "\'"),
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: AppColors.offblack,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
