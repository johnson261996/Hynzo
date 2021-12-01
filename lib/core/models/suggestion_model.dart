class SuggestionModel{
  final int? count;
  final String? next;
  final String? previous;
  final int? statusCode;
  List<ResultsModel> resultsList;

  SuggestionModel({
    this.count,
    this.next,
    this.previous,
    this.statusCode,
    required this.resultsList,
  });

  factory SuggestionModel.fromJson(Map<String, dynamic> json,int code) {
    return SuggestionModel(
      count: json['count'] ?? -1,
      next: json['next'] ?? '',
      previous: json['previous'] ?? '',
      resultsList: ((json['results'] as List<dynamic>).map((i) => ResultsModel.fromJson(i)).toList()),
      statusCode: code,
    );
  }

}

class ResultsModel {
  final int? pk;
  final String? username;
  final String? avatar;
  final bool? isGroup;
  final int? noOfParticipants;
  bool? isSelected;

  ResultsModel({
    this.pk,
    this.username,
    this.avatar,
    this.isGroup,
    this.noOfParticipants,
    this.isSelected = false,
  });

  factory ResultsModel.fromJson(Map<String, dynamic> json) {
    return ResultsModel(
      pk: json['pk'] ?? -1,
      username: json['username'] ?? '',
      avatar: json['avatar'] ?? '',
      isGroup: json['is_group'] ?? false,
      noOfParticipants: json['no_of_participants'] ?? -1,
    );
  }
}