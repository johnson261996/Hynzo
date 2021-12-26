class SuggestionModel {
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

  factory SuggestionModel.fromJson(Map<String, dynamic> json, int code) {
    return SuggestionModel(
      count: json['count'] ?? 0,
      next: json['next'] ?? '',
      previous: json['previous'] ?? '',
      resultsList: ((json['results'] as List<dynamic>)
          .map((i) => ResultsModel.fromJson(i))
          .toList()),
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

class SuggestUserAddResponseModel {
  final int? id;
  final String? messages;
  final List<String>? participants;
  final bool? isGroup;
  final int? statusCode;

  SuggestUserAddResponseModel({
    this.id,
    this.messages,
    this.participants,
    this.isGroup,
    this.statusCode,
  });

  factory SuggestUserAddResponseModel.fromJson(
      Map<String, dynamic> json, int code) {
    return SuggestUserAddResponseModel(
      id: json['id'],
      messages: json['messages'],
      participants: ((json['participants'] as List<dynamic>)
          .map((i) => i.toString())
          .toList()),
      isGroup: json['is_group'],
      statusCode: code,
    );
  }
}
