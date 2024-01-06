import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kobciye/models/country_model.dart';
import 'network_parser.dart';

abstract class RemoteDataSource {
  Future<dynamic> httpGet({required String url});
  Future<dynamic> httpPost({required Map<String,dynamic> body,required String url});
  // Future<String> passwordChange(
  //     ChangePasswordStateModel changePassData, String StudentId);
}

typedef CallClientMethod = Future<http.Response> Function();

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({required this.client});


  @override
  Future<dynamic> httpGet({required String url}) async {
     final headers = {'Accept': 'application/json'};
    final uri = Uri.parse(url);

    final clientMethod = http.get(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody;
  }



  @override
  Future<String> httpPost({required Map<String,dynamic> body,required String url}) async {
    final headers = {'Accept': 'application/json'};
    print(url);
    final clientMethod = client.post(Uri.parse(url),
        headers: headers, body: json.encode(body));
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody;
  }


}
