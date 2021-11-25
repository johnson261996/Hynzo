import 'package:flutter/material.dart';
import 'package:hynzo/core/models/events_model.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/widgets/common/view/event_view_widget.dart';

class TodayWidget extends StatefulWidget {
  const TodayWidget({Key? key}) : super(key: key);

  @override
  State<TodayWidget> createState() => _TodayWidgetState();
}

class _TodayWidgetState extends State<TodayWidget> {
  List<EventsModel> allEvents = [];
  List<EventsModel> allCategories = [];
  List<EventsModel> allWorkshops = [];
  List<EventsModel> allKids = [];
  List<EventsModel> allComedy = [];
  List<EventsModel> allMusic = [];
  List<EventsModel> allFit = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allEvents.add(
      EventsModel(
        imagePath: 'assets/images/events_dummy_one.png',
        title: 'Sunday Night Party',
        subTitle: 'Badmash Louunge: Koramongala',
        dateTime: 'Sat, 13 Nov',
      ),
    );
    allEvents.add(
      EventsModel(
        imagePath: 'assets/images/events_dummy_two.png',
        title: 'Sunday Night Party',
        subTitle: 'Badmash Louunge: Koramongala',
        dateTime: 'Fri, 12 Nov',
      ),
    );
    allEvents.add(
      EventsModel(
        imagePath: 'assets/images/events_dummy_one.png',
        title: 'Sunday Night Party',
        subTitle: 'Badmash Louunge: Koramongala',
        dateTime: 'Thu, 11 Nov',
      ),
    );
    allCategories.add(
      EventsModel(
        imagePath: 'assets/images/event_category_one.png',
        title: 'WorkShops',
      ),
    );
    allCategories.add(
      EventsModel(
        imagePath: 'assets/images/event_category_two.png',
        title: 'Kids',
      ),
    );
    allCategories.add(
      EventsModel(
        imagePath: 'assets/images/event_category_three.png',
        title: 'Music',
      ),
    );
    allCategories.add(
      EventsModel(
        imagePath: 'assets/images/event_category_four.png',
        title: 'Comedy',
      ),
    );
    allCategories.add(
      EventsModel(
        imagePath: 'assets/images/event_category_five.png',
        title: 'Stay fit',
      ),
    );
    allCategories.add(
      EventsModel(
        imagePath: 'assets/images/event_category_one.png',
        title: 'Esports',
      ),
    );
    allWorkshops.add(
      EventsModel(
        imagePath: 'assets/images/events_dummy_three.png',
        title: 'Sunday Night Party',
        dateTime: 'Sat, 13 Nov',
      ),
    );
    allWorkshops.add(
      EventsModel(
        imagePath: 'assets/images/events_dummy_four.png',
        title: 'Sunday Night Party',
        dateTime: 'Sat, 13 Nov',
      ),
    );
    allWorkshops.add(
      EventsModel(
        imagePath: 'assets/images/events_dummy_five.png',
        title: 'Sunday Night Party',
        dateTime: 'Sat, 13 Nov',
      ),
    );
    allWorkshops.add(
      EventsModel(
        imagePath: 'assets/images/events_dummy_three.png',
        title: 'Sunday Night Party',
        dateTime: 'Sat, 13 Nov',
      ),
    );
    allWorkshops.add(
      EventsModel(
        imagePath: 'assets/images/events_dummy_four.png',
        title: 'Sunday Night Party',
        dateTime: 'Sat, 13 Nov',
      ),
    );
    allWorkshops.add(
      EventsModel(
        imagePath: 'assets/images/events_dummy_five.png',
        title: 'Sunday Night Party',
        dateTime: 'Sat, 13 Nov',
      ),
    );
    allKids.add(
      EventsModel(
        imagePath: 'assets/images/events_dummy_three.png',
        title: 'Sunday Night Party',
        dateTime: 'Sat, 13 Nov',
      ),
    );
    allKids.add(
      EventsModel(
        imagePath: 'assets/images/events_dummy_four.png',
        title: 'Sunday Night Party',
        dateTime: 'Sat, 13 Nov',
      ),
    );
    allKids.add(
      EventsModel(
        imagePath: 'assets/images/events_dummy_five.png',
        title: 'Sunday Night Party',
        dateTime: 'Sat, 13 Nov',
      ),
    );
    allKids.add(
      EventsModel(
        imagePath: 'assets/images/events_dummy_three.png',
        title: 'Sunday Night Party',
        dateTime: 'Sat, 13 Nov',
      ),
    );
    allKids.add(
      EventsModel(
        imagePath: 'assets/images/events_dummy_four.png',
        title: 'Sunday Night Party',
        dateTime: 'Sat, 13 Nov',
      ),
    );
    allKids.add(
      EventsModel(
        imagePath: 'assets/images/events_dummy_five.png',
        title: 'Sunday Night Party',
        dateTime: 'Sat, 13 Nov',
      ),
    );
    allMusic.add(
      EventsModel(
        imagePath: 'assets/images/events_dummy_three.png',
        title: 'Sunday Night Party',
        dateTime: 'Sat, 13 Nov',
      ),
    );
    allMusic.add(
      EventsModel(
        imagePath: 'assets/images/events_dummy_four.png',
        title: 'Sunday Night Party',
        dateTime: 'Sat, 13 Nov',
      ),
    );
    allMusic.add(
      EventsModel(
        imagePath: 'assets/images/events_dummy_five.png',
        title: 'Sunday Night Party',
        dateTime: 'Sat, 13 Nov',
      ),
    );
    allMusic.add(
      EventsModel(
        imagePath: 'assets/images/events_dummy_three.png',
        title: 'Sunday Night Party',
        dateTime: 'Sat, 13 Nov',
      ),
    );
    allMusic.add(
      EventsModel(
        imagePath: 'assets/images/events_dummy_four.png',
        title: 'Sunday Night Party',
        dateTime: 'Sat, 13 Nov',
      ),
    );
    allMusic.add(
      EventsModel(
        imagePath: 'assets/images/events_dummy_five.png',
        title: 'Sunday Night Party',
        dateTime: 'Sat, 13 Nov',
      ),
    );
    allComedy.add(
      EventsModel(
        imagePath: 'assets/images/events_dummy_three.png',
        title: 'Sunday Night Party',
        dateTime: 'Sat, 13 Nov',
      ),
    );
    allComedy.add(
      EventsModel(
        imagePath: 'assets/images/events_dummy_four.png',
        title: 'Sunday Night Party',
        dateTime: 'Sat, 13 Nov',
      ),
    );
    allComedy.add(
      EventsModel(
        imagePath: 'assets/images/events_dummy_five.png',
        title: 'Sunday Night Party',
        dateTime: 'Sat, 13 Nov',
      ),
    );
    allComedy.add(
      EventsModel(
        imagePath: 'assets/images/events_dummy_three.png',
        title: 'Sunday Night Party',
        dateTime: 'Sat, 13 Nov',
      ),
    );
    allComedy.add(
      EventsModel(
        imagePath: 'assets/images/events_dummy_four.png',
        title: 'Sunday Night Party',
        dateTime: 'Sat, 13 Nov',
      ),
    );
    allComedy.add(
      EventsModel(
        imagePath: 'assets/images/events_dummy_five.png',
        title: 'Sunday Night Party',
        dateTime: 'Sat, 13 Nov',
      ),
    );
    allFit.add(
      EventsModel(
        imagePath: 'assets/images/events_dummy_three.png',
        title: 'Sunday Night Party',
        dateTime: 'Sat, 13 Nov',
      ),
    );
    allFit.add(
      EventsModel(
        imagePath: 'assets/images/events_dummy_four.png',
        title: 'Sunday Night Party',
        dateTime: 'Sat, 13 Nov',
      ),
    );
    allFit.add(
      EventsModel(
        imagePath: 'assets/images/events_dummy_five.png',
        title: 'Sunday Night Party',
        dateTime: 'Sat, 13 Nov',
      ),
    );
    allFit.add(
      EventsModel(
        imagePath: 'assets/images/events_dummy_three.png',
        title: 'Sunday Night Party',
        dateTime: 'Sat, 13 Nov',
      ),
    );
    allFit.add(
      EventsModel(
        imagePath: 'assets/images/events_dummy_four.png',
        title: 'Sunday Night Party',
        dateTime: 'Sat, 13 Nov',
      ),
    );
    allFit.add(
      EventsModel(
        imagePath: 'assets/images/events_dummy_five.png',
        title: 'Sunday Night Party',
        dateTime: 'Sat, 13 Nov',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery=MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: mediaQuery.height * 0.02,
          ),
          Container(
            width: mediaQuery.width,
            height: mediaQuery.height * 0.27,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.only(
                    right: 12.0,
                  ),
                  child: EventContainerWidget(
                    imagePath: allEvents[index].imagePath!,
                    title: allEvents[index].title!,
                    subTitle: allEvents[index].subTitle!,
                    dateTime: allEvents[index].dateTime!,
                    showDate: true,
                    showSubTitle: true,
                  ),
                );
              },
              itemCount: allEvents.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(
            height: mediaQuery.height * 0.04,
          ),
          Text(
            Strings.CATEGORIES_TITLE,
            style: Theme.of(context).textTheme.headline6!.apply(
                  color: AppColors.greyBlack,
                ),
          ),
          Text(
            Strings.CATEGORIES_SUBTITLE,
            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  color: AppColors.offwhite,
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
          ),
          SizedBox(
            height: mediaQuery.height * 0.015,
          ),
          Container(
            width: mediaQuery.width,
            height: mediaQuery.height * 0.3,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(
                right: 10.0,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 5,
                childAspectRatio: 1.1,
              ),
              itemBuilder: (BuildContext context, int index) {
                return EventContainerWidget(
                  imagePath: allCategories[index].imagePath!,
                  title: allCategories[index].title!,
                  subTitle: allCategories[index].subTitle!,
                  dateTime: allCategories[index].dateTime!,
                  showDate: false,
                  showSubTitle: false,
                );
              },
              itemCount: allCategories.length,
            ),
          ),
          SizedBox(
            height: mediaQuery.height * 0.03,
          ),
          Text(
            Strings.WORKSHOPS,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
          ),
          SizedBox(
            height: mediaQuery.height * 0.01,
          ),
          Container(
            padding: const EdgeInsets.only(
              right: 10.0,
            ),
            width: mediaQuery.width,
            height: mediaQuery.height * 0.50,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 5,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (BuildContext context, int index) {
                return EventContainerWidget(
                  imagePath: allWorkshops[index].imagePath!,
                  title: allWorkshops[index].title!,
                  subTitle: allWorkshops[index].subTitle!,
                  dateTime: allWorkshops[index].dateTime!,
                  showDate: true,
                  showSubTitle: false,
                );
              },
              itemCount: allWorkshops.length,
            ),
          ),
          SizedBox(
            height: mediaQuery.height * 0.03,
          ),
          Text(
            Strings.KIDS,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
          ),
          SizedBox(
            height: mediaQuery.height * 0.01,
          ),
          Container(
            width: mediaQuery.width,
            height: mediaQuery.height * 0.50,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(
                right: 10.0,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 5,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (BuildContext context, int index) {
                return EventContainerWidget(
                  imagePath: allKids[index].imagePath!,
                  title: allKids[index].title!,
                  subTitle: allKids[index].subTitle!,
                  dateTime: allKids[index].dateTime!,
                  showDate: true,
                  showSubTitle: false,
                );
              },
              itemCount: allWorkshops.length,
            ),
          ),
          SizedBox(
            height: mediaQuery.height * 0.03,
          ),
          Text(
            Strings.MUSIC,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
          ),
          SizedBox(
            height: mediaQuery.height * 0.01,
          ),
          Container(
            width: mediaQuery.width,
            height: mediaQuery.height * 0.50,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(
                right: 10.0,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 5,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (BuildContext context, int index) {
                return EventContainerWidget(
                  imagePath: allMusic[index].imagePath!,
                  title: allMusic[index].title!,
                  subTitle: allMusic[index].subTitle!,
                  dateTime: allMusic[index].dateTime!,
                  showDate: true,
                  showSubTitle: false,
                );
              },
              itemCount: allMusic.length,
            ),
          ),
          SizedBox(
            height: mediaQuery.height * 0.03,
          ),
          Text(
            Strings.COMEDY,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
          ),
          SizedBox(
            height: mediaQuery.height * 0.01,
          ),
          Container(
            width: mediaQuery.width,
            height: mediaQuery.height * 0.50,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(
                right: 10.0,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 5,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (BuildContext context, int index) {
                return EventContainerWidget(
                  imagePath: allComedy[index].imagePath!,
                  title: allComedy[index].title!,
                  subTitle: allComedy[index].subTitle!,
                  dateTime: allComedy[index].dateTime!,
                  showDate: true,
                  showSubTitle: false,
                );
              },
              itemCount: allComedy.length,
            ),
          ),
          SizedBox(
            height: mediaQuery.height * 0.03,
          ),
          Text(
            Strings.FIT,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
          ),
          SizedBox(
            height: mediaQuery.height * 0.01,
          ),
          Container(
            width: mediaQuery.width,
            height: mediaQuery.height * 0.50,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(
                right: 10.0,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 5,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (BuildContext context, int index) {
                return EventContainerWidget(
                  imagePath: allFit[index].imagePath!,
                  title: allFit[index].title!,
                  subTitle: allFit[index].subTitle!,
                  dateTime: allFit[index].dateTime!,
                  showDate: true,
                  showSubTitle: false,
                );
              },
              itemCount: allFit.length,
            ),
          ),
        ],
      ),
    );
  }
}
