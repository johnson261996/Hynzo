import 'package:flutter/material.dart';
import 'package:hynzo/core/models/news_home_model.dart';
import 'package:hynzo/routes/routes.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/utils/navigations.dart';
import 'package:intl/intl.dart';

class PoliticsNewsWidget extends StatefulWidget{
  final List<NewsContentDataModel>? allContent;
  const PoliticsNewsWidget({Key? key,this.allContent}) : super(key: key);

  @override
  State<PoliticsNewsWidget> createState() => _PoliticsNewsWidgetState();
}

class _PoliticsNewsWidgetState extends State<PoliticsNewsWidget> {
  String getDate(String time) {
    var now = DateTime.now();
    var formatter = DateFormat('MM/dd/yyyy');
    String currentDate = formatter.format(now);
    var newsdate=DateTime.parse(time);
    String newsDate= formatter.format(newsdate);
    if(currentDate.split("/")[1] == newsDate.split("/")[1]){
      return DateFormat.jm().format(DateTime.parse(time));
    } else {
      var diff = newsdate.difference(now).inDays;
      if(diff> 1){
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
      return Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Text(
            'No news available',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      );
    } else {
      return Container(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigation.pushNamed(context, Routes.webview,
                    {'link': widget.allContent![index].link});
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
                      Container(
                        width: 120.0,
                        height: 120.0,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0),),
                          child: Image.network(
                            widget.allContent![index].imageUrl!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => ClipRRect(
                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10.0),bottomLeft:  Radius.circular(10.0)),
                              child: Image.asset('assets/images/no_image.png',fit: BoxFit.cover,),
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
                          Container(
                            width: mediaQuery.width * 0.50,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    widget.allContent![index].title!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                      color: AppColors.greyBlue,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'open_sans',
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  getDate(widget.allContent![index].pubDate!),
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                    fontSize: 10.33,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'open_sans',
                                    color: AppColors.greyBlue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: mediaQuery.height * 0.01,
                          ),
                          Container(
                            width: 150.0,
                            child: Text(
                              widget.allContent![index].description!
                                  .replaceAll(
                                  RegExp(r'[^A-Za-z0-9().,;?]'), ' '),
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.blackBlue,
                              ),
                            ),
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
        ),
      );
    }
  }
}