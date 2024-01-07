import 'dart:convert';

import 'package:equatable/equatable.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ApiBaseResponse extends Equatable {
  final int status;
  final String message;
  final dynamic data;

  const ApiBaseResponse({required this.status, required this.message, required this.data});

  @override
  String toString() => 'ApiBaseResponse(status: $status, message: $message, data: $data)';

  ApiBaseResponse copyWith({
    int? status,
    String? message,
    dynamic data,
  }) {
    return ApiBaseResponse(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': data,
    };
  }

  factory ApiBaseResponse.fromMap(Map<String, dynamic> map) {
    return ApiBaseResponse(
      status: (map["status"] ?? 0) as int,
      message: (map["message"] ?? '') as String,
      data: map["data"] ?? null as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiBaseResponse.fromJson(String source) => ApiBaseResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props => [status, message, data];
}
