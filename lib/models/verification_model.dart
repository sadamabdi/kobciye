import 'dart:convert';

import 'package:equatable/equatable.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class OtpModel extends Equatable {
    final String sId;
  final String serviceSid;
  final String accountSid;
  final String to;
  final String status;
  final bool valid;
  final int verificationId;

  const OtpModel({required this.sId, required this.serviceSid, required this.accountSid, required this.to, required this.status, required this.valid,  required this.verificationId});

  @override
  String toString() {
    return 'OtpModel(sId: $sId, serviceSid: $serviceSid, accountSid: $accountSid, to: $to, status: $status, valid: $valid, verificationId: $verificationId)';
  }

  OtpModel copyWith({
    String? sId,
    String? serviceSid,
    String? accountSid,
    String? to,
    String? status,
    bool? valid,
    DateTime? dateCreated,
    DateTime? dateModified,
    int? verificationId,
  }) {
    return OtpModel(
      sId: sId ?? this.sId,
      serviceSid: serviceSid ?? this.serviceSid,
      accountSid: accountSid ?? this.accountSid,
      to: to ?? this.to,
      status: status ?? this.status,
      valid: valid ?? this.valid,
      verificationId: verificationId ?? this.verificationId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sId': sId,
      'serviceSid': serviceSid,
      'accountSid': accountSid,
      'to': to,
      'status': status,
      'valid': valid,
      'verificationId': verificationId,
    };
  }

  factory OtpModel.fromMap(Map<String, dynamic> map) {
    return OtpModel(
      sId: (map["sId"] ?? '') as String,
      serviceSid: (map["serviceSid"] ?? '') as String,
      accountSid: (map["accountSid"] ?? '') as String,
      to: (map["to"] ?? '') as String,
      status: (map["status"] ?? '') as String,
      valid: (map["valid"] ?? false) as bool,
      verificationId: (map["verificationId"] ?? 0) as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory OtpModel.fromJson(String source) => OtpModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props {
    return [
      sId,
      serviceSid,
      accountSid,
      to,
      status,
      valid,
      verificationId,
    ];
  }
}
