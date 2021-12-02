import 'package:flutter/material.dart';
import 'package:hynzo/core/models/news_home_model.dart';
import 'package:hynzo/themes/colors.dart';

class TodayNewsWidget extends StatefulWidget{
  const TodayNewsWidget({Key? key}) : super(key: key);

  @override
  State<TodayNewsWidget> createState() => _TodayNewsWidgetState();
}

class _TodayNewsWidgetState extends State<TodayNewsWidget> {
  //List<NewsModel> allNews = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      /*child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.only(
              right: 15.0,
              top: 10.0,
            ),
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
                    child:Image.asset(allNews[index]
                        .newsImagePath!,fit: BoxFit.cover,),
                  ),
                  SizedBox(
                    width: mediaQuery.width * 0.03,
                  ),
                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: mediaQuery.width*0.48,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              allNews[index].newsTitle!,
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
                            Spacer(),
                            Text(
                              allNews[index].newsPublishedTime!,
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
                          allNews[index].newsContent!,
                          maxLines: 2,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: AppColors.blackBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: allNews.length,
        padding: EdgeInsets.zero,
      ),*/
    );
  }
}