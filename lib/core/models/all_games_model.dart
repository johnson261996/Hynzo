

class RecentPlayedResponseModel {
  final List<GamePlayModel>? recentPlayedGames;
  final int? statusCode;

  RecentPlayedResponseModel({
    this.recentPlayedGames,
    this.statusCode,
  });
  factory RecentPlayedResponseModel.fromJson(
      Map<String, dynamic> json, int code) {
    return RecentPlayedResponseModel(
      recentPlayedGames: json['results'] != null
          ? ((json['results'] as List<dynamic>)
          .map((i) => GamePlayModel.fromJson(i))
          .toList())
          : [],
      statusCode: code,
    );
  }
}

class SuggestedGamesResponseModel {
  final List<GamePlayModel>? allSuggestedGames;
  final int? statusCode;

  SuggestedGamesResponseModel({
    this.allSuggestedGames,
    this.statusCode,
  });

  factory SuggestedGamesResponseModel.fromJson(
      Map<String, dynamic> json, int code) {
    return SuggestedGamesResponseModel(
      allSuggestedGames: json['results'] != null
          ? ((json['results'] as List<dynamic>)
              .map((i) => GamePlayModel.fromJson(i))
              .toList())
          : [],
      statusCode: code,
    );
  }
}

class GamePlayModel {
  final String? gameName;
  final String? category;
  final String? image;
  final String? redirectionType;
  final String? redirectionUrl;
  final bool? activeStatus;
  final String? priority;
  final String? createdAt;
  final String? upDatedAt;

  GamePlayModel({
    this.gameName,
    this.category,
    this.image,
    this.redirectionType,
    this.redirectionUrl,
    this.activeStatus,
    this.priority,
    this.createdAt,
    this.upDatedAt,
  });

  factory GamePlayModel.fromJson(Map<String, dynamic> json) {
    return GamePlayModel(
      gameName: json['game_name'] ?? '',
      category: json['category'] ?? '',
      image: json['image'] ?? '',
      redirectionType: json['redirection_type'] ?? '',
      redirectionUrl: json['redirection_url'] ?? '',
      activeStatus: json['active_status'] ?? false,
      priority: json['priority'] ?? '',
      createdAt: json['created_at'] ?? '',
      upDatedAt: json['updated_at'] ?? '',
    );
  }
}

class AllGamesModel {
  final String? imagePath;
  final String? gameName;

  AllGamesModel({
    this.imagePath,
    this.gameName,
  });
}

class GamesCategoryModel {
  final String? imagePath;

  GamesCategoryModel({
    this.imagePath,
  });
}
