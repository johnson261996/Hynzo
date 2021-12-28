import 'package:flutter/material.dart';
import 'package:hynzo/core/models/news_home_model.dart';
import 'package:hynzo/routes/routes.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/utils/navigations.dart';
import 'package:intl/intl.dart';

class AllNewsWidget extends StatefulWidget {
  final List<Article>? allContent;

  const AllNewsWidget({Key? key, this.allContent}) : super(key: key);

  @override
  State<AllNewsWidget> createState() => _AllNewsWidgetState();
}

class _AllNewsWidgetState extends State<AllNewsWidget> {
  String getDate(String time) {
    var now = DateTime.now();
    var formatter = DateFormat('dd/MM/yyyy');
    String currentDate = formatter.format(now);
    var newsdate = DateTime.parse(time);
    String newsDate = formatter.format(newsdate);
    if (currentDate.split("/")[0] == newsDate.split("/")[0]) {
      return DateFormat.jm().format(DateTime.parse(time));
    } else {
      var diff = now.difference(newsdate).inDays;
      if (diff > 1) {
        return newsDate;
      } else {
        return 'Yesterday';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    if (widget.allContent!.isEmpty) {
      return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Text(
            'No news available',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigation.pushNamed(context, Routes.webview,
                  {'link': widget.allContent![index].url});
            },
            child: Container(
              margin: const EdgeInsets.only(
                right: 15.0,
                top: 10.0,
              ),
              height: 120.0,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 120.0,
                      height: 120.0,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                        ),
                        child: Image.network(
                          widget.allContent![index].urlToImage.toString(),
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0)),
                            child: Image.asset(
                              'assets/images/no_image.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: mediaQuery.width * 0.03,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: mediaQuery.width * 0.50,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                    widget.allContent![index].title!.replaceAll(
                                        RegExp(r'[^A-Za-z0-9().,;?]'), ' '),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.headline6!),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: mediaQuery.height * 0.01,
                        ),
                        SizedBox(
                          width: mediaQuery.width * 0.5,
                          child: Text(
                              widget.allContent![index].description!.replaceAll(
                                  RegExp(r'[^A-Za-z0-9().,;?]'), ' '),
                              softWrap: true,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyText2!),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: widget.allContent!.length,
        padding: EdgeInsets.zero,
      );
    }
  }
}
