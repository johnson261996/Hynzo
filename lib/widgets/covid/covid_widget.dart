import 'package:flutter/material.dart';
import 'package:hynzo/core/models/covid_model.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/utils/navigations.dart';
import 'package:hynzo/widgets/covid/covid_state_card.dart';
import 'package:hynzo/widgets/covid/covid_top_widget.dart';

// import 'month.dart';

class CovidWidget extends StatefulWidget {
  final CovidData? covidData;
  const CovidWidget({this.covidData, Key? key}) : super(key: key);

  @override
  State<CovidWidget> createState() => _CovidWidgetState();
}

class _CovidWidgetState extends State<CovidWidget>
    with TickerProviderStateMixin {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  List<CovidStateCard> renderStateData() {
    // if (widget.covidData != null) {
    return widget.covidData!.regional!
        .map(
          (data) => CovidStateCard(
            name: data.loc.toString(),
            totalConfirmed: data.totalConfirmed ?? 0,
            deaths: data.deaths ?? 0,
            discharged: data.discharged ?? 0,
          ),
        )
        .toList();
    // }
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: mediaQuery.height * 0.07,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15.0,
            right: 15.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigation.pop(context);
                },
                child: Image.asset(
                  'assets/images/top_back.png',
                  width: 15,
                  height: 15,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                width: mediaQuery.width * 0.02,
              ),
              Text(
                Strings.COVID,
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      color: AppColors.greyBlack,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const Spacer(),
            ],
          ),
        ),
        if (widget.covidData != null)
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
            child: CovidHeading(covidData: widget.covidData!),
          ),
        if (widget.covidData != null)
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
                child: Column(
                  children: renderStateData(),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
