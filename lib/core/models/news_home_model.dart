class NewsResponseModel {
  final int? statusCode;
  final List<NewsDataModel>? newsDataList;

  NewsResponseModel({
    this.statusCode,
    this.newsDataList,
  });

  factory NewsResponseModel.fromJson(Map<String,dynamic> json,int code) {
    return NewsResponseModel(
      newsDataList: json['news_data'] !=  null ? ((json['news_data'] as List<dynamic>).map((i) => NewsDataModel.fromJson(i)).toList()) : [],
      statusCode: code,
    );
  }


}

class NewsDataModel {
  final int? id;
  final List<NewsContentDataModel>? newsDataContentList;
  final String? createdAt;
  final String? category;
  final String? updatedAt;

  NewsDataModel({
    this.id,
    this.newsDataContentList,
    this.category,
    this.createdAt,
    this.updatedAt,
  });

  factory NewsDataModel.fromJson(Map<String,dynamic> json) {
    return NewsDataModel(
      id: json['id'] ?? -1,
      category: json['category'] ?? '',
      createdAt: json['created_at'] ?? '',
      newsDataContentList: json['news_data'] != null ?((json['news_data'] as List<dynamic>).map((i) => NewsContentDataModel.fromJson(i)).toList()) : [],
      updatedAt: json['updated_at'] ?? '',
    );
  }


}

class NewsContentDataModel {
  final String? link;
  final String? title;
  final String? content;
  final List<String>? creator;
  final String? pubDate;
  final List<String>? keywords;
  final String? imageUrl;
  final String? sourceId;
  final String? videoUrl;
  final String? description;
  final String? fullDescription;

  NewsContentDataModel({
    this.link,
    this.title,
    this.content,
    this.creator,
    this.keywords,
    this.imageUrl,
    this.sourceId,
    this.pubDate,
    this.videoUrl,
    this.description,
    this.fullDescription,
  });
  factory NewsContentDataModel.fromJson(Map<String,dynamic> json) {
    return NewsContentDataModel(
      link: json['link'] ?? '',
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      creator: json['creator'] != null ? ((json['creator'] as List<dynamic>).map((i) => i.toString()).toList()) : [],
      pubDate: json['pubDate'] ?? '',
      keywords: json['keywords'] != null ? ((json['keywords'] as List<dynamic>).map((i) => i.toString()).toList()) : [],
      imageUrl: json['image_url'] ?? '',
      sourceId: json['source_id'] ?? '',
      videoUrl: json['video_url'] ?? '',
      description: json['description'] ?? '',
      fullDescription: json['full_description'] ?? '',
    );
  }

}