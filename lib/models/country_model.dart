// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class CountryModel extends Equatable {
  final String name;
  final List<dynamic> callingCodes;
  final Flags flags;

  const CountryModel({required this.name, required this.callingCodes, required this.flags});

  @override
  String toString() => 'CountryModel(name: $name, callingCodes: $callingCodes, flags: $flags)';

  CountryModel copyWith({
    String? name,
    List<dynamic>? callingCodes,
    Flags? flags,
  }) {
    return CountryModel(
      name: name ?? this.name,
      callingCodes: callingCodes ?? this.callingCodes,
      flags: flags ?? this.flags,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'callingCodes': callingCodes,
      'flags': flags.toMap(),
    };
  }

  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      name: (map["name"] ?? '') as String,
      callingCodes: List<dynamic>.from(((map['callingCodes'] ?? const <dynamic>[]) as List<dynamic>),),
      flags: Flags.fromMap((map["flags"]?? Map<String,dynamic>.from({})) as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryModel.fromJson(String source) => CountryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props => [name, callingCodes, flags];
}

class Flags extends Equatable {
  final String svg;
  final String png;

  Flags({required this.svg, required this.png});

  @override
  String toString() => 'Flags(svg: $svg, png: $png)';

  Flags copyWith({
    String? svg,
    String? png,
  }) {
    return Flags(
      svg: svg ?? this.svg,
      png: png ?? this.png,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'svg': svg,
      'png': png,
    };
  }

  factory Flags.fromMap(Map<String, dynamic> map) {
    return Flags(
      svg: (map["svg"] ?? '') as String,
      png: (map["png"] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Flags.fromJson(String source) => Flags.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props => [svg, png];
}
