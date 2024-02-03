// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class VerifyOtp extends Equatable {
 final String accessToken;
  const VerifyOtp({
    required this.accessToken,
  });

  VerifyOtp copyWith({
    String? accessToken,
  }) {
    return VerifyOtp(
      accessToken: accessToken ?? this.accessToken,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'access_token': accessToken,
    };
  }

  factory VerifyOtp.fromMap(Map<String, dynamic> map) {
    return VerifyOtp(
      accessToken: (map["access_token"] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory VerifyOtp.fromJson(String source) => VerifyOtp.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'VerifyOtp(access_token: $accessToken)';

 

  @override
  List<Object> get props => [accessToken];
}
