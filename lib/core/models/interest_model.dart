import 'dart:convert';

class InterestResponseModel {
  final int? count;
  final String? next;
  final String? previous;
  final int? statusCode;
  List<ResultsModel> resultsList;

  InterestResponseModel({
    this.count,
    this.next,
    this.previous,
    this.statusCode,
    required this.resultsList,
  });

  factory InterestResponseModel.fromJson(Map<String, dynamic> json,int code) {
    return InterestResponseModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      resultsList: ((json['results'] as List<dynamic>).map((i) => ResultsModel.fromJson(i)).toList()),
      statusCode: code,
    );
  }
}

class ResultsModel {
  final int? id;
  final String? interest;
  final String? interestImage;
  final int? createdBy;
  bool? isSelected;
  final bool? isActive;

  ResultsModel({
    this.id,
    this.interestImage,
    this.createdBy,
    this.isSelected,
    this.interest,
    this.isActive,
  });

  factory ResultsModel.fromJson(Map<String, dynamic> json) {
    return ResultsModel(
      id: json['id'],
      interest: json['interest'],
      interestImage: json['interest_image'],
      createdBy: json['created_by'],
      isSelected: json['is_selected'],
      isActive: json['is_active'],
    );
  }
}
