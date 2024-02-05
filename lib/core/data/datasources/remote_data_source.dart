import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kobciye/models/response_model.dart';
import 'network_parser.dart';

abstract class RemoteDataSource {
  Future<ApiBaseResponse> httpGet({required String url});
  Future<ApiBaseResponse> httpPost(
      {required Map<String, dynamic> body, required String url});
  // Future<String> passwordChange(
  //     ChangePasswordStateModel changePassData, String StudentId);
}

typedef CallClientMethod = Future<http.Response> Function();

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<ApiBaseResponse> httpGet({required String url}) async {
    final headers = {'Content-Type': 'application/json'};

    final uri = Uri.parse(url);

    if (kDebugMode) {
      print(uri);
    }

    final clientMethod = http.get(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return ApiBaseResponse.fromMap(responseJsonBody);
  }

  @override
  Future<ApiBaseResponse> httpPost(
      {required Map<String, dynamic> body, required String url}) async {
    final headers = {'Content-Type': 'application/json'};
    if (kDebugMode) {
      print(url);
      print(json.encode(body));
    }
    final clientMethod =
        client.post(Uri.parse(url), headers: headers, body: json.encode(body));
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return ApiBaseResponse.fromMap(responseJsonBody);
  }
}
