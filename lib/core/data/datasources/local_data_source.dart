import 'package:kobciye/constants/app_constants.dart';
import 'package:kobciye/models/verify_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../error/exception.dart';

abstract class LocalDataSource {
  VerifyOtp getUserResponseModel();
  Future<bool> cacheUserResponse(VerifyOtp userLoginResponseModel);
  Future<bool> clearUserProfile();
}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSourceImpl({required this.sharedPreferences});

  @override
  VerifyOtp getUserResponseModel() {
    final jsonString =
        sharedPreferences.getString(AppConstants.cachedUserResponseKey);
    if (jsonString != null) {
      return VerifyOtp.fromJson(jsonString);
    } else {
      throw const DatabaseException('Not cached yet');
    }
  }

  @override
  Future<bool> cacheUserResponse(VerifyOtp userLoginResponseModel) {
    return sharedPreferences.setString(
      AppConstants.cachedUserResponseKey,
      userLoginResponseModel.toJson(),
    );
  }

  @override
  Future<bool> clearUserProfile() {
    return sharedPreferences.remove(AppConstants.cachedUserResponseKey);
  }
}
