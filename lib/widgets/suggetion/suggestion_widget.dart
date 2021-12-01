import 'package:flutter/material.dart';
import 'package:hynzo/core/models/suggestion_model.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/routes/routes.dart';
import 'package:hynzo/themes/colors.dart';

class SuggestionWidget extends StatefulWidget {
  List<ResultsModel> allResults;
  final bool? isLoading;
  final int? totalCount;

  SuggestionWidget({
    Key? key,
    required this.allResults,
    this.isLoading,
    this.totalCount,
  }) : super(key: key);

  @override
  State<SuggestionWidget> createState() => _SuggestionWidgetState();
}

class _SuggestionWidgetState extends State<SuggestionWidget> {
  double _setProgressvalue() {
    int count = 0;
    for (var element in widget.allResults) {
      if (element.isSelected!) {
        count++;
      }
    }
    double value = (count / widget.totalCount!).toDouble();
    String progressValue = value.toStringAsFixed(1);
    return double.parse(progressValue);
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
                Strings.SUGGESTION_TITLE,
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      color: AppColors.gray,
                      fontWeight: FontWeight.w500,
                    ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 110.0,),
            child: ListView.builder(
              padding: const EdgeInsets.only(
                right: 5.0,
                left: 5.0,
                bottom: 80.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: widget.allResults[index].avatar != ''
                      ? CircleAvatar(
                          radius: 22.5,
                          backgroundImage:
                              NetworkImage(widget.allResults[index].avatar!))
                      : Image.asset(
                          'assets/images/user.png',
                          fit: BoxFit.contain,
                          width: 45,
                          height: 45,
                        ),
                  title: Text(
                    widget.allResults[index].username!,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: AppColors.black,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  trailing: widget.allResults[index].isSelected!
                      ? ElevatedButton(
                          onPressed: () {
                            setState(() {
                              widget.allResults[index].isSelected =
                                  !widget.allResults[index].isSelected!;
                            });
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
                            style: Theme.of(context).textTheme.button!.copyWith(
                                color: AppColors.blueDark,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            setState(() {
                              widget.allResults[index].isSelected =
                                  !widget.allResults[index].isSelected!;
                            });
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
                            style: Theme.of(context).textTheme.button!.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                );
              },
              itemCount: widget.allResults.length,
            ),
          ),
          if (!widget.isLoading!) ...[
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, Routes.location);
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
                          value: _setProgressvalue(),
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
        ],
      ),
    );
  }
}
