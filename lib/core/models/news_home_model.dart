class NewsModel {
  final String? newsImagePath;
  final String? newsTitle;
  final String? newsContent;
  final String? newsPublishedTime;

  NewsModel({
    this.newsImagePath,
    this.newsTitle,
    this.newsContent,
    this.newsPublishedTime,
  });
}

class NewsArticleModel {
  final int? id;
  ArticleModel articleModel;
  final String? publishedAt;
  final String? createdAt;
  final String? updatedAt;

  NewsArticleModel({
    this.id,
    required this.articleModel,
    this.publishedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory NewsArticleModel.fromJson(Map<String,dynamic> json) {
    return NewsArticleModel(
      id: json['id'] ?? -1,
      articleModel: ArticleModel.fromJson(json['articles']),
      publishedAt: json['publishedAt'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}

class ArticleModel {
  final String? url;
  final String? title;
  final String? author;
  final String? content;
  SourceModel sourceModel;
  final String? urlToImage;
  final String? description;
  final String? publishedAt;

  ArticleModel({
    this.url,
    this.title,
    this.author,
    required this.sourceModel,
    this.urlToImage,
    this.content,
    this.description,
    this.publishedAt,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      url: json['url'] ?? '',
      title: json['title'] ?? '',
      author: json['author'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
      content: json['content'] ?? '',
      description: json['description'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
      sourceModel: SourceModel.fromJson(json['source']),
    );
  }
}

class SourceModel {
  final String? id;
  final String? name;

  const SourceModel({
    this.id,
    this.name,
  });

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}
