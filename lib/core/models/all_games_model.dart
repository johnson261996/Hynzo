class GamesResponseModel {
  final List<GamePlayModel>? recentGames;
  final List<GamePlayModel>? popularGames;
  final List<GamePlayModel>? allGames;
  final int? statusCode;

  GamesResponseModel({
    this.recentGames,
    this.popularGames,
    this.allGames,
    this.statusCode,
  });

  factory GamesResponseModel.fromJson(Map<String, dynamic> json, int code) {
    return GamesResponseModel(
      recentGames: json['recent_games'] != null
          ? ((json['recent_games'] as List<dynamic>)
              .map((i) => GamePlayModel.fromJson(i))
              .toList())
          : [],
      popularGames: json['popular_games'] != null
          ? ((json['popular_games'] as List<dynamic>)
              .map((i) => GamePlayModel.fromJson(i))
              .toList())
          : [],
      allGames: json['all_games'] != null
          ? ((json['all_games'] as List<dynamic>)
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

  factory SuggestedGamesResponseModel.fromJson(Map<String, dynamic> json,
      int code) {
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

class FilteredGamesResponseModel {
  final List<GamePlayModel>? filteredGames;
  final int? statusCode;

  FilteredGamesResponseModel({
    this.filteredGames,
    this.statusCode,
  });

  factory FilteredGamesResponseModel.fromJson(Map<String, dynamic> json,
      int code) {
    return FilteredGamesResponseModel(
      filteredGames: json['results'] != null
          ? ((json['results'] as List<dynamic>)
          .map((i) => GamePlayModel.fromJson(i))
          .toList())
          : [],
      statusCode: code,
    );
  }
}

class GamePlayModel {
  final int? id;
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
    this.id,
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
      id: json["id"] ?? 0,
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

class GamesCategoryModel {
  final String? imagePath;

  GamesCategoryModel({
    this.imagePath,
  });
}
