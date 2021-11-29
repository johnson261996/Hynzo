import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hynzo/core/models/interest_model.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/routes/routes.dart';
import 'package:hynzo/themes/colors.dart';

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
      InterestModel(
        imagePath: 'assets/images/gym.png',
        name: 'Cricket',
        selectionStatus: false,
      ),
    );
    allInterest.add(
      InterestModel(
        imagePath: 'assets/images/camera.png',
        name: 'Photography',
        selectionStatus: false,
      ),
    );
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
      color: AppColors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              top: 100.0,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                Strings.INTEREST_TITLE,
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
                  left: 20.0, right: 20.0, top: 180.0, bottom: 20.0),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                itemCount: allInterest.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.3,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        allInterest[index].selectionStatus =
                            !allInterest[index].selectionStatus;
                      });
                      bool isAnySelected = false;
                      for (int i = 0; i < allInterest.length; i++) {
                        if (allInterest[i].selectionStatus) {
                          isAnySelected = true;
                          break;
                        }
                      }
                      if (isAnySelected) {
                        isSelected = true;
                      } else {
                        isSelected = false;
                      }
                    },
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: ClipPath(
                        clipper: ShapeBorderClipper(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Container(
                          decoration: allInterest[index].selectionStatus
                              ? BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.pink,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(15))
                              : null,
                          child: Stack(
                            children: [
                              Center(
                                child: Image.asset(
                                  allInterest[index].imagePath!,
                                  fit: BoxFit.contain,
                                  width: 60,
                                  height: 80,
                                ),
                              ),
                              if (allInterest[index].selectionStatus) ...[
                                Positioned(
                                  right: 20.0,
                                  left: 110.0,
                                  top: 20.0,
                                  child: Image.asset(
                                    'assets/images/check.png',
                                    fit: BoxFit.contain,
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                              ],
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 10.0,
                                  ),
                                  child: Text(
                                    allInterest[index].name!,
                                    style: !allInterest[index].selectionStatus
                                        ? Theme.of(context).textTheme.headline6
                                        : Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .apply(
                                              color: AppColors.pink,
                                            ),
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
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: isSelected
                  ? () {
                      Navigator.pushReplacementNamed(context, Routes.location);
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
