class GameSuggestionModel {
  GameSuggestionModel({
    required this.count,
    this.next,
    this.previous,
    required this.results,
    this.statusCode,
  });

  int count;
  dynamic next;
  dynamic previous;
  List<GameSuggestion> results;
  int? statusCode;

  factory GameSuggestionModel.fromJson(Map<String, dynamic> json, int code) =>
      GameSuggestionModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<GameSuggestion>.from(
            json["results"].map((x) => GameSuggestion.fromJson(x))),
        statusCode: code,
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class GameSuggestion {
  GameSuggestion({
    required this.id,
    required this.gameName,
    required this.category,
    required this.image,
    required this.redirectionType,
    required this.redirectionUrl,
    required this.activeStatus,
    required this.priority,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String gameName;
  String category;
  String image;
  String redirectionType;
  String redirectionUrl;
  bool activeStatus;
  String priority;
  DateTime createdAt;
  DateTime updatedAt;

  factory GameSuggestion.fromJson(Map<String, dynamic> json) => GameSuggestion(
        id: json["id"],
        gameName: json["game_name"],
        category: json["category"],
        image: json["image"],
        redirectionType: json["redirection_type"],
        redirectionUrl: json["redirection_url"],
        activeStatus: json["active_status"],
        priority: json["priority"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "game_name": gameName,
        "category": category,
        "image": image,
        "redirection_type": redirectionType,
        "redirection_url": redirectionUrl,
        "active_status": activeStatus,
        "priority": priority,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
