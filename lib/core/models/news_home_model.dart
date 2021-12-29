class NewsResponseModel {
  final int? count;
  final dynamic next;
  final dynamic previous;
  final int? statusCode;
  final List<Result> results;

  NewsResponseModel({
    this.count,
    this.next,
    this.previous,
    required this.results,
    this.statusCode,
  });

  factory NewsResponseModel.fromJson(Map<String, dynamic> json, int code) =>
      NewsResponseModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        statusCode: code,
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "statusCode": statusCode,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.id,
    required this.news,
    required this.category,
    required this.country,
    required this.language,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  News news;
  String category;
  String country;
  String language;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Result.fromJson(Map<String, dynamic> json) =>
      Result(
        id: json["id"],
        news: News.fromJson(json["news"]),
        category: json["category"],
        country: json["country"],
        language: json["language"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "news": news.toJson(),
        "category": category,
        "country": country,
        "language": language,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class News {
  News({
    required this.status,
    required this.articles,
    required this.totalResults,
  });

  String status;
  List<Article> articles;
  int totalResults;

  factory News.fromJson(Map<String, dynamic> json) =>
      News(
        status: json["status"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
        totalResults: json["totalResults"],
      );

  Map<String, dynamic> toJson() =>
      {
        "status": status,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
        "totalResults": totalResults,
      };
}

class Article {
  Article({
    this.url,
    this.title,
    this.author,
    this.source,
    this.content,
    this.urlToImage,
    this.description,
    this.publishedAt,
  });

  String? url;
  String? title;
  String? author;
  Map? source;
  String? content;
  String? urlToImage;
  String? description;
  DateTime? publishedAt;

  factory Article.fromJson(Map<String, dynamic> json) =>
      Article(
        url: json["url"],
        title: json["title"],
        author: json["author"],
        source: json["source"],
        content: json["content"],
        urlToImage: json["urlToImage"],
        description: json["description"],
        publishedAt: DateTime.parse(json["publishedAt"]),
      );

  Map<String, dynamic> toJson() =>
      {
        "url": url,
        "title": title,
        "author": author,
        "source": source,
        "content": content,
        "urlToImage": urlToImage,
        "description": description,
        "publishedAt": publishedAt,
      };
}
