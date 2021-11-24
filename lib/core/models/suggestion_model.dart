import 'package:flutter/cupertino.dart';

class SuggestionModel{
  final String? profileImage;
  final String? name;
  final String? city;
  final String? country;
  bool isAdded;

  SuggestionModel({
    this.profileImage,
    this.name,
    this.city,
    this.country,
    required this.isAdded,
  });

}