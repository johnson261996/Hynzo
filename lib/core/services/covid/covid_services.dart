import 'dart:async' show Future;
import 'dart:convert';

import 'package:hynzo/core/models/covid_model.dart';
import 'package:hynzo/core/services/service_base.dart';

/// This class contains the Covid Data.
/// [CovidService] Covid Data API's
/// Use [CovidService] like this:
/// ```dart
///   CovidService().getCovid();
/// ```

class CovidService {
  static Future<CovidModel> getCovid() async {
    var response = await ServiceBase.get(
        url: 'covid19-in/stats/latest',
        baseUrl: 'https://api.rootnet.in/',
        headers: {"Content-Type": "application/json"});
    return CovidModel.fromJson(jsonDecode(response.body));
  }
}
