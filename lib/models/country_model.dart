// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class CountryModel extends Equatable {
  final int countryId;
  final String countryName;
  final int callingCodes;
  final String flagUrl1;

  const CountryModel({required this.countryId, required this.countryName, required this.callingCodes, required this.flagUrl1});

  @override
  String toString() {
    return 'CountryModel(countryId: $countryId, countryName: $countryName, callingCodes: $callingCodes, flagUrl1: $flagUrl1)';
  }

  CountryModel copyWith({
    int? countryId,
    String? countryName,
    int? callingCodes,
    String? flagUrl1,
  }) {
    return CountryModel(
      countryId: countryId ?? this.countryId,
      countryName: countryName ?? this.countryName,
      callingCodes: callingCodes ?? this.callingCodes,
      flagUrl1: flagUrl1 ?? this.flagUrl1,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'countryId': countryId,
      'countryName': countryName,
      'callingCodes': callingCodes,
      'flagUrl1': flagUrl1,
    };
  }

  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      countryId: (map["countryId"] ?? 0) as int,
      countryName: (map["countryName"] ?? '') as String,
      callingCodes: (map["callingCodes"] ?? 0) as int,
      flagUrl1: (map["flagUrl1"] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryModel.fromJson(String source) => CountryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props => [countryId, countryName, callingCodes, flagUrl1];
  }
