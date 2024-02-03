import 'package:dartz/dartz.dart';
import 'package:kobciye/core/remote_urls.dart';
import 'package:kobciye/models/verification_model.dart';
import 'package:kobciye/models/verify_model.dart';
import '../core/data/datasources/local_data_source.dart';
import '../core/data/datasources/remote_data_source.dart';
import '../core/error/exception.dart';
import '../core/error/failure.dart';

abstract class OtpRepository {
  Future<Either<Failure, OtpModel>> sendOtp();
  Future<Either<Failure, VerifyOtp>> verifyOtp(Map<String, dynamic> body);
  Either<Failure, VerifyOtp> getCashedUserInfo();
  Future<Either<Failure, bool>> logOut();
}

class OtpRepositoryImp extends OtpRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  OtpRepositoryImp({
    required this.remoteDataSource,
    required this.localDataSource
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
  Future<Either<Failure, VerifyOtp>> verifyOtp(Map<String, dynamic> body) async {
    try {
      final resp = await remoteDataSource.httpPost(
          url: RemoteUrls.verifyOtp, body: body);
      final mapList = resp.data;
      final accessToken = VerifyOtp.fromMap(mapList);
      localDataSource.cacheUserResponse(accessToken);
      return Right(accessToken);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }


    @override
  Either<Failure, VerifyOtp> getCashedUserInfo() {
    try {
      final result = localDataSource.getUserResponseModel();
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

    @override
  Future<Either<Failure, bool>> logOut()  async{
    try {
     bool result = await localDataSource.clearUserProfile();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
