class CovidModel {
  CovidModel({
    required this.success,
    this.data,
    this.lastRefreshed,
    this.lastOriginUpdate,
  });

  bool success;
  CovidData? data;
  DateTime? lastRefreshed;
  DateTime? lastOriginUpdate;

  factory CovidModel.fromJson(Map<String, dynamic> json) => CovidModel(
        success: json["success"],
        data: CovidData.fromJson(json["data"]),
        lastRefreshed: DateTime.parse(json["lastRefreshed"]),
        lastOriginUpdate: DateTime.parse(json["lastOriginUpdate"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data,
        "lastRefreshed": lastRefreshed,
        "lastOriginUpdate": lastOriginUpdate,
      };
}

class CovidData {
  CovidData({
    this.summary,
    this.unofficialSummary,
    this.regional,
  });

  Summary? summary;
  List<UnofficialSummary>? unofficialSummary;
  List<Regional>? regional;

  factory CovidData.fromJson(Map<String, dynamic> json) => CovidData(
        summary: Summary.fromJson(json["summary"]),
        unofficialSummary: List<UnofficialSummary>.from(
            json["unofficial-summary"]
                .map((x) => UnofficialSummary.fromJson(x))),
        regional: List<Regional>.from(
            json["regional"].map((x) => Regional.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "summary": summary,
        "unofficial-summary": unofficialSummary,
        "regional": regional,
      };
}

class Regional {
  Regional({
    this.loc,
    this.confirmedCasesIndian,
    this.confirmedCasesForeign,
    this.discharged,
    this.deaths,
    this.totalConfirmed,
  });

  String? loc;
  int? confirmedCasesIndian;
  int? confirmedCasesForeign;
  int? discharged;
  int? deaths;
  int? totalConfirmed;

  factory Regional.fromJson(Map<String, dynamic> json) => Regional(
        loc: json["loc"],
        confirmedCasesIndian: json["confirmedCasesIndian"],
        confirmedCasesForeign: json["confirmedCasesForeign"],
        discharged: json["discharged"],
        deaths: json["deaths"],
        totalConfirmed: json["totalConfirmed"],
      );

  Map<String, dynamic> toJson() => {
        "loc": loc,
        "confirmedCasesIndian": confirmedCasesIndian,
        "confirmedCasesForeign": confirmedCasesForeign,
        "discharged": discharged,
        "deaths": deaths,
        "totalConfirmed": totalConfirmed,
      };
}

class Summary {
  Summary({
    this.total,
    this.confirmedCasesIndian,
    this.confirmedCasesForeign,
    this.discharged,
    this.deaths,
    this.confirmedButLocationUnidentified,
  });

  int? total;
  int? confirmedCasesIndian;
  int? confirmedCasesForeign;
  int? discharged;
  int? deaths;
  int? confirmedButLocationUnidentified;

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        total: json["total"],
        confirmedCasesIndian: json["confirmedCasesIndian"],
        confirmedCasesForeign: json["confirmedCasesForeign"],
        discharged: json["discharged"],
        deaths: json["deaths"],
        confirmedButLocationUnidentified:
            json["confirmedButLocationUnidentified"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "confirmedCasesIndian": confirmedCasesIndian,
        "confirmedCasesForeign": confirmedCasesForeign,
        "discharged": discharged,
        "deaths": deaths,
        "confirmedButLocationUnidentified": confirmedButLocationUnidentified,
      };
}

class UnofficialSummary {
  UnofficialSummary({
    this.source,
    this.total,
    this.recovered,
    this.deaths,
    this.active,
  });

  String? source;
  int? total;
  int? recovered;
  int? deaths;
  int? active;

  factory UnofficialSummary.fromJson(Map<String, dynamic> json) =>
      UnofficialSummary(
        source: json["source"],
        total: json["total"],
        recovered: json["recovered"],
        deaths: json["deaths"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "source": source,
        "total": total,
        "recovered": recovered,
        "deaths": deaths,
        "active": active,
      };
}
