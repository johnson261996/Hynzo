import 'package:flutter/material.dart';
import 'package:hynzo/core/models/covid_model.dart';
import 'package:hynzo/core/models/user_profile_model.dart';
import 'package:hynzo/providers/covid_provider.dart';
import 'package:hynzo/providers/update_profile_provider.dart';
import 'package:hynzo/providers/user_profile_provider.dart';
import 'package:hynzo/utils/localstorage.dart';
import 'package:hynzo/utils/toast_util.dart';
import 'package:hynzo/widgets/covid/covid_widget.dart';
import 'package:hynzo/widgets/edit-profile/edit_profile_widget.dart';
import 'package:provider/provider.dart';

class CovidContainer extends StatefulWidget {
  const CovidContainer({Key? key}) : super(key: key);

  @override
  State<CovidContainer> createState() => _CovidContainerState();
}

class _CovidContainerState extends State<CovidContainer> {
  static CovidProvider? _covidProvider;
  CovidData? covidData;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _covidProvider = Provider.of<CovidProvider>(context, listen: false);
    getCovid();
  }

  Future<void> getCovid() async {
    try {
      CovidModel covidDataModel = await _covidProvider!.getCovidData();
      setState(() {
        _isLoading = false;
      });
      if (covidDataModel.success) {
        setState(() {
          covidData = covidDataModel.data;
        });
      } else {
        ToastUtil().showToast("Something went wrong.");
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ToastUtil().showToast(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return CovidWidget(covidData: covidData);
  }
}
