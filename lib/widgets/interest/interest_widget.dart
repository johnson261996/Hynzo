import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hynzo/core/models/interest_model.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/themes/colors.dart';

class InterestWidget extends StatefulWidget {
  final Function? addInterest;
  final Function? fetchInterest;

  InterestWidget({
    Key? key,
    this.addInterest,
    this.fetchInterest,
  }) : super(key: key);

  @override
  State<InterestWidget> createState() => _InterestWidgetState();
}

class _InterestWidgetState extends State<InterestWidget> {
  String interestIds = '';
  int offset = 0;
  ScrollController _sccontroller = new ScrollController();
  List<ResultsModel> allResults = [];

  @override
  void initState() {
    getInterestList();
    super.initState();
  }

  getInterestList() async {
    InterestResponseModel response = await widget.fetchInterest!(
      "15",
      '0',
    );
    if (response.resultsList.isNotEmpty) {
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        setState(() {
          allResults = response.resultsList;
        });
      });
    }
  }

  double _setProgressValue() {
    int count = 0;
    for (var element in allResults) {
      if (element.isSelected!) {
        count++;
      }
    }
    if (allResults.isEmpty) {
      return 0.0;
    } else {
      double value = (count.toDouble() / allResults.length.toDouble());
      String progressValue = value.toStringAsFixed(1);
      return double.parse(progressValue);
    }
  }

  @override
  void dispose() {
    _sccontroller.dispose();
    super.dispose();
  }

  _addInterest() {
    for (var element in allResults) {
      if (element.isSelected!) {
        if (interestIds == '') {
          interestIds = element.id.toString();
        } else {
          interestIds = interestIds + " ," + element.id.toString();
        }
      }
    }
    if (interestIds == '') {
      var snackBar = SnackBar(
        content: Text(
          'You need to select one of them from above',
          style: Theme.of(context).textTheme.subtitle2!.apply(
                color: AppColors.white,
              ),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      widget.addInterest!(interestIds);
    }
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
              top: 80.0,
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
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 150.0, bottom: 20.0),
            child: GridView.builder(
              shrinkWrap: true,
              controller: _sccontroller,
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: allResults.length,
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
                      allResults[index].isSelected =
                          !allResults[index].isSelected!;
                    });
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
                        decoration: allResults[index].isSelected!
                            ? BoxDecoration(
                                border: Border.all(
                                  color: AppColors.pink,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(15))
                            : null,
                        child: Stack(
                          children: [
                            Positioned(
                              right: 50.0,
                              left: 50.0,
                              top: 15.0,
                              child: Image.network(
                                allResults[index].interestImage!,
                                fit: BoxFit.contain,
                                width: 60,
                                height: 60,
                              ),
                            ),
                            if (allResults[index].isSelected!) ...[
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
                                  left: 5.0,
                                  right: 5.0,
                                ),
                                child: Text(
                                  allResults[index].interest!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: !allResults[index].isSelected!
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
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () {
                _addInterest();
              },
              child: Container(
                width: 80,
                height: 80,
                padding: const EdgeInsets.only(
                  right: 20,
                  bottom: 20,
                ),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white,
                      ),
                      width: 70.0,
                      height: 70.0,
                      child: CircularProgressIndicator(
                        value: _setProgressValue(),
                        backgroundColor: AppColors.blueGray,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.blueDark,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/images/next_button.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
