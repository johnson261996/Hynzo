import 'package:flutter/material.dart';
import 'package:invent_chat/core/models/suggestion_model.dart';
import 'package:invent_chat/resources/strings.dart';
import 'package:invent_chat/routes/routes.dart';
import 'package:invent_chat/themes/colors.dart';
import 'package:invent_chat/themes/themes.dart';
import 'package:invent_chat/utils/localStorage.dart';
import 'package:invent_chat/widgets/common/buttons/primary_button.dart';

class SuggetionWidget extends StatefulWidget {
  const SuggetionWidget({Key? key}) : super(key: key);

  @override
  State<SuggetionWidget> createState() => _SuggetionWidgetState();
}

class _SuggetionWidgetState extends State<SuggetionWidget> {
  List<SuggestionModel> allSuggestionList = [];
  bool isSelected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allSuggestionList.add(
      SuggestionModel(
          profileImage: 'assets/images/dummy_user_one.png',
          name: 'Bessie Copper',
          city: 'Bengaluru',
          country: 'India',
          isAdded: false),
    );
    allSuggestionList.add(
      SuggestionModel(
          profileImage: 'assets/images/dummy_user_two.png',
          name: 'Guy Hawkins',
          city: 'Bengaluru',
          country: 'India',
          isAdded: false),
    );
    allSuggestionList.add(
      SuggestionModel(
          profileImage: 'assets/images/dummy_user_three.png',
          name: 'Jacob Jones',
          city: 'Bengaluru',
          country: 'India',
          isAdded: false),
    );
    allSuggestionList.add(
      SuggestionModel(
          profileImage: 'assets/images/dummy_user_four.png',
          name: 'Arlenee McCoy',
          city: 'Bengaluru',
          country: 'India',
          isAdded: false),
    );
    allSuggestionList.add(
      SuggestionModel(
          profileImage: 'assets/images/dummy_user_five.png',
          name: 'Jane Copper',
          city: 'Bengaluru',
          country: 'India',
          isAdded: false),
    );
    allSuggestionList.add(
      SuggestionModel(
          profileImage: 'assets/images/dummy_user_six.png',
          name: 'Robert Fox',
          city: 'Bengaluru',
          country: 'India',
          isAdded: false),
    );
    allSuggestionList.add(
      SuggestionModel(
          profileImage: 'assets/images/dummy_user_seven.png',
          name: 'Devon Lane',
          city: 'Bengaluru',
          country: 'India',
          isAdded: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              top: 100.0,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                Strings.SUGGESTION_TITLE,
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      color: AppColors.gray,
                      fontWeight: FontWeight.w500,
                    ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                right: 5.0,
                bottom: 5.0,
                left: 5.0,
                top: 10.0,
              ),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Image.asset(
                      allSuggestionList[index].profileImage!,
                      fit: BoxFit.contain,
                      width: 45,
                      height: 45,
                    ),
                    title: Text(
                      allSuggestionList[index].name!,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    subtitle: Text(
                      '${allSuggestionList[index].city}, ${allSuggestionList[index].country}',
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    trailing: allSuggestionList[index].isAdded
                        ? ElevatedButton(
                            onPressed: () {
                              setState(() {
                                allSuggestionList[index].isAdded =
                                    !allSuggestionList[index].isAdded;
                              });
                              bool isAdded = false;
                              for (int i = 0;
                                  i < allSuggestionList.length;
                                  i++) {
                                if (allSuggestionList[i].isAdded) {
                                  isAdded = true;
                                  break;
                                }
                              }
                              if (isAdded) {
                                isSelected = true;
                              } else {
                                isSelected = false;
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.white,
                              minimumSize: const Size(90.0, 40.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(color: AppColors.blueDark),
                              ),
                            ),
                            child: Text(
                              Strings.ADDED,
                              style: Theme.of(context)
                                  .textTheme
                                  .button!
                                  .copyWith(
                                      color: AppColors.blueDark,
                                      fontWeight: FontWeight.w500),
                            ),
                          )
                        : ElevatedButton(
                            onPressed: () {
                              setState(() {
                                allSuggestionList[index].isAdded =
                                    !allSuggestionList[index].isAdded;
                              });
                              bool isAdded = false;
                              for (int i = 0;
                                  i < allSuggestionList.length;
                                  i++) {
                                if (allSuggestionList[i].isAdded) {
                                  isAdded = true;
                                  break;
                                }
                              }
                              if (isAdded) {
                                isSelected = true;
                              } else {
                                isSelected = false;
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.blueDark,
                              minimumSize: const Size(90.0, 40.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: Text(
                              Strings.ADD,
                              style:
                                  Theme.of(context).textTheme.button!.copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                            ),
                          ),
                  );
                },
                itemCount: allSuggestionList.length,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: isSelected
                  ? () {
                      Navigator.pushReplacementNamed(context, Routes.navScreen);
                    }
                  : () {
                      var snackBar = SnackBar(
                        content: Text(
                          'You need to select one of them from above',
                          style: Theme.of(context).textTheme.subtitle2!.apply(
                                color: AppColors.white,
                              ),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
              child: Container(
                color: Colors.transparent,
                padding: const EdgeInsets.only(
                  right: 20,
                  bottom: 20,
                ),
                width: 80,
                height: 80,
                child: Image.asset(
                  'assets/images/first_button.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
