import 'package:dartz/dartz.dart';
import 'package:kobciye/core/remote_urls.dart';
import 'package:kobciye/models/country_model.dart';
import '../core/data/datasources/remote_data_source.dart';
import '../core/error/exception.dart';
import '../core/error/failure.dart';

abstract class CountriesRepository {
  Future<Either<Failure, List<CountryModel>>> getCountries();
}

class CountriesRepositoryImp extends CountriesRepository {
  final RemoteDataSource remoteDataSource;
  CountriesRepositoryImp({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<CountryModel>>> getCountries() async {
    try {
      final result = await remoteDataSource.httpGet(url: RemoteUrls.rootUrl);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
