import 'package:flutter/cupertino.dart';
import 'package:hynzo/core/models/covid_model.dart';
import 'package:hynzo/core/services/covid/covid_services.dart';

class CovidProvider extends ChangeNotifier {
  Future<CovidModel> getCovidData() async {
    final CovidModel response = await CovidService.getCovid();
    notifyListeners();
    return response;
  }
}
