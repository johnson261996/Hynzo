import 'package:flutter/material.dart';
import 'package:hynzo/core/models/tab_header_model.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/widgets/events/today.dart';
import 'package:hynzo/widgets/events/tommorrow.dart';
import 'package:hynzo/widgets/events/week.dart';
import 'package:hynzo/widgets/events/year.dart';

import 'month.dart';

class EventWidget extends StatefulWidget {
  const EventWidget({Key? key}) : super(key: key);

  @override
  State<EventWidget> createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  List<TabHeaderModel> allTabHeader = [];
  int selectedIndexValue = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allTabHeader.add(
      TabHeaderModel(
        tabName: 'Today',
      ),
    );
    allTabHeader.add(
      TabHeaderModel(
        tabName: 'Tommorrow',
      ),
    );
    allTabHeader.add(
      TabHeaderModel(
        tabName: 'This Week',
      ),
    );
    allTabHeader.add(
      TabHeaderModel(
        tabName: 'This Month',
      ),
    );
    allTabHeader.add(
      TabHeaderModel(
        tabName: 'This Year',
      ),
    );
  }

  Widget _getSelectedWidget(int index) {
    switch (index) {
      case 0:
        return TodayWidget();
      case 1:
        return TommorrowWidget();
      case 2:
        return WeeekWidget();
      case 3:
        return MonthWidget();
      case 4:
        return YearWidget();
      default:
        return TodayWidget();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15.0,
            ),
            child: Row(
              children: [
                Text(
                  Strings.EVENTS,
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        color: AppColors.greyBlack,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: 20,
                    color: AppColors.offBlack,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 15.0,
            ),
            width: MediaQuery.of(context).size.width,
            height: 25.0,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndexValue = index;
                    });
                  },
                  child: Container(
                    width: 80.0,
                    height: 25.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: index == selectedIndexValue
                          ? AppColors.blueDark
                          : AppColors.white,
                    ),
                    child: Center(
                      child: Text(
                        allTabHeader[index].tabName!,
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              fontSize: 13,
                              color: index == selectedIndexValue
                                  ? AppColors.white
                                  : AppColors.greyBlack,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: allTabHeader.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.015,
          ),
          Divider(
            color: AppColors.offgrey,
            height: 1.0,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(
                  left: 15.0,
                ),
                child: _getSelectedWidget(selectedIndexValue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
