import 'package:flutter/material.dart';
import 'package:invent_chat/core/models/interest_model.dart';
import 'package:invent_chat/resources/strings.dart';
import 'package:invent_chat/routes/routes.dart';
import 'package:invent_chat/themes/colors.dart';

class InterestWidget extends StatefulWidget {
  const InterestWidget({Key? key}) : super(key: key);

  @override
  State<InterestWidget> createState() => _InterestWidgetState();
}

class _InterestWidgetState extends State<InterestWidget> {
  List<InterestModel> allInterest = [];
  bool isSelected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allInterest.add(
      InterestModel(imagePath: 'assets/images/gym.png',
        name: 'Cricket',
        selectionStatus: false,),);
    allInterest.add(InterestModel(
      imagePath: 'assets/images/camera.png',
      name: 'Photography',
      selectionStatus: false,),);
    allInterest.add(
      InterestModel(
        imagePath: 'assets/images/burger.png',
        name: 'Cooking',
        selectionStatus: false,
      ),
    );
    allInterest.add(
      InterestModel(
        imagePath: 'assets/images/books.png',
        name: 'Books',
        selectionStatus: false,
      ),
    );
    allInterest.add(
      InterestModel(
        imagePath: 'assets/images/compass.png',
        name: 'Travel',
        selectionStatus: false,
      ),
    );
    allInterest.add(
      InterestModel(
        imagePath: 'assets/images/paint.png',
        name: 'Movies',
        selectionStatus: false,
      ),
    );
    allInterest.add(
      InterestModel(
        imagePath: 'assets/images/game.png',
        name: 'Video Games',
        selectionStatus: false,
      ),
    );
    allInterest.add(
      InterestModel(
        imagePath: 'assets/images/tree.png',
        name: 'Dance',
        selectionStatus: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: MediaQuery
          .of(context)
          .size
          .height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
            ),
            child: Text(
              Strings.DUMMY_TEXT,
              style: Theme
                  .of(context)
                  .textTheme
                  .headline5,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: allInterest.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 20,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      allInterest[index].selectionStatus =
                      !allInterest[index].selectionStatus;
                    });
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ClipPath(
                      clipper: ShapeBorderClipper(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: Container(
                        decoration: allInterest[index].selectionStatus
                            ? BoxDecoration(
                            color: AppColors.pink
                        )
                            : null,
                        child: Stack(
                          children: [
                        Center(
                        child: Image.network(allInterest[index].imagePath!,
                          fit: BoxFit.contain, width: 50, height: 70,),
                      ),
                      Positioned(
                        right: 20.0,
                        left: 150.0,
                        top: 20.0,
                        child: Image.asset(
                          'assets/images/check.png',
                          fit: BoxFit.contain,
                          width: 20,
                          height: 20,
                        ),),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20.0,),
                          child: Text(
                            allInterest[index].name!,
                            style: Theme
                                .of(context)
                                .textTheme
                                .headline5,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                        ],
                      ),
                    ),
                  ),
                ),

                );
              },
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: isSelected
                  ? () {
                Navigator.pushReplacementNamed(context, Routes.onboarding);
              }
                  : null,
              child: Container(
                width: 70,
                height: 70,
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
