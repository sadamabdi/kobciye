import 'package:dartz/dartz.dart';
import 'package:kobciye/core/remote_urls.dart';
import 'package:kobciye/models/verification_model.dart';
import '../core/data/datasources/remote_data_source.dart';
import '../core/error/exception.dart';
import '../core/error/failure.dart';

abstract class OtpRepository {
  Future<Either<Failure, OtpModel>> sendOtp();
  Future<Either<Failure, String>> verifyOtp(Map<String, dynamic> body);
}

class OtpRepositoryImp extends OtpRepository {
  final RemoteDataSource remoteDataSource;
  OtpRepositoryImp({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, OtpModel>> sendOtp() async {
    try {
      final resp = await remoteDataSource.httpGet(url: RemoteUrls.sendOtp);
      final mapList = resp.data;

      final result = OtpModel.fromMap(mapList);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, String>> verifyOtp(Map<String, dynamic> body) async {
    try {
      print(RemoteUrls.verifyOtp);
      final resp = await remoteDataSource.httpPost(
          url: RemoteUrls.verifyOtp, body: body);
      final mapList = resp.data.access_token;
      return Right(mapList);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
