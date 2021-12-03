import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hynzo/core/models/news_home_model.dart';
import 'package:hynzo/routes/routes.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/utils/navigations.dart';

class NewsSwipeView extends StatefulWidget {
  final List<NewsContentDataModel>? allContent;

  const NewsSwipeView({
    Key? key,
    this.allContent,
  }) : super(key: key);

  @override
  State<NewsSwipeView> createState() => _NewsSwipeViewState();
}

class _NewsSwipeViewState extends State<NewsSwipeView> {
  int selectedIndex = 0;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        color: AppColors.offwhite.withOpacity(0.1),
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
                  selectedIndex++;
                });
              }
            }
          },
          child: Card(
            elevation: 5,
            child: Container(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                bottom: 10.0,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigation.pushNamed(context, Routes.webview,
                      {'link': widget.allContent![selectedIndex].link});
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
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
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>  ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset('assets/images/no_image.png',fit: BoxFit.cover,),
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
                    Wrap(
                      direction: Axis.horizontal,
                      children: [
                        Text(
                          widget.allContent![selectedIndex].fullDescription! !=
                                  ''
                              ? widget
                                  .allContent![selectedIndex].fullDescription!
                                  .replaceAll(
                                      RegExp(r'[^A-Za-z0-9().,;?]'), ' ')
                              : widget.allContent![selectedIndex].description!
                                  .replaceAll(
                                      RegExp(r'[^A-Za-z0-9().,;?]'), ' '),
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          maxLines: 20,
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: AppColors.offblack,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
