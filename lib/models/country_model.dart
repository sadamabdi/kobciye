// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class CountryModel extends Equatable {
  final int id;
  final String title;
  final String? url;

  const CountryModel({required this.id, required this.title, required this.url});

  @override
  String toString() => 'CountryModel(id: $id, title: $title, url: $url)';

  CountryModel copyWith({
    int? id,
    String? title,
    String? url,
  }) {
    return CountryModel(
      id: id ?? this.id,
      title: title ?? this.title,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'url': url,
    };
  }

  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      id: map['id'] as int,
      title: map['title'] as String,
      url: map['url'] != null ? map['url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryModel.fromJson(String source) => CountryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props => [id, title, url ?? ''];
}
