import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hynzo/core/models/interest_model.dart';
import 'package:hynzo/providers/news_provider.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/routes/routes.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/utils/connectivity.dart';
import 'package:hynzo/utils/toast_util.dart';

class InterestWidget extends StatefulWidget {
  List<ResultsModel> allResults;
  final Function? addInterest;
  final Function? fetchInterest;
  final bool? isNextValueEmpty;
  final int? totalCount;

  InterestWidget({
    Key? key,
    required this.allResults,
    this.addInterest,
    this.fetchInterest,
    this.isNextValueEmpty,
    this.totalCount,
  }) : super(key: key);

  @override
  State<InterestWidget> createState() => _InterestWidgetState();
}

class _InterestWidgetState extends State<InterestWidget> {
  String interestIds = '';
  int offset = 0;
  ScrollController _sccontroller = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _sccontroller.addListener(() {
      if (_sccontroller.position.pixels ==
          _sccontroller.position.maxScrollExtent) {
        if (!widget.isNextValueEmpty!) {
          ConnectionStaus().check().then((connectionStatus) {
            if (connectionStatus) {
              offset = offset + 10;
              widget.fetchInterest!(
                "10",
                (offset).toString(),
              );
            } else {
              ToastUtil().showToast(
                  "No internet connection available. Please check your connection or try again later.");
            }
          });
        }
      }
    });
  }

  double _setProgressvalue(){
    int count = 0;
    for (var element in widget.allResults) {
      if (element.isSelected!) {
        count ++;
      }
    }
    double value = (count / widget.totalCount!).toDouble();
    String progressValue = value.toStringAsFixed(1);
    return double.parse(progressValue);
  }

  @override
  void dispose() {
    _sccontroller.dispose();
    super.dispose();
  }

  _addInterest() {
    ConnectionStaus().check().then((connectionStatus) {
      if (connectionStatus) {
        for (var element in widget.allResults) {
          if (element.isSelected!) {
            if (interestIds == '') {
              interestIds = element.id.toString();
            } else {
              interestIds = interestIds + element.id.toString();
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
      } else {
        ToastUtil().showToast(
            "No internet connection available. Please check your connection or try again later.");
      }
    });
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
          Container(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 150.0, bottom: 20.0),
              child: GridView.builder(
                controller: _sccontroller,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: widget.allResults.length,
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
                        widget.allResults[index].isSelected =
                            !widget.allResults[index].isSelected!;
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
                          decoration: widget.allResults[index].isSelected!
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
                                child: Image.network(
                                  widget.allResults[index].interestImage!,
                                  fit: BoxFit.contain,
                                  width: 60,
                                  height: 80,
                                ),
                              ),
                              if (widget.allResults[index].isSelected!) ...[
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
                                    widget.allResults[index].interest!,
                                    style: !widget.allResults[index].isSelected!
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
                      width: 70.0,
                      height: 70.0,
                      child: CircularProgressIndicator(value: _setProgressvalue(),backgroundColor: AppColors.blueGray,valueColor:  AlwaysStoppedAnimation<Color>(AppColors.blueDark,),),
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
