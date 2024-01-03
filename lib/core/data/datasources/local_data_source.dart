// import 'package:shared_preferences/shared_preferences.dart';

// import '../../../models/login/controller/models/user_login_response_model.dart';
// import '../../../utils/k_strings.dart';
// import '../../error/exception.dart';

// abstract class LocalDataSource {
//   UserLoginResponseModel getUserResponseModel();
//   Future<bool> cacheUserResponse(UserLoginResponseModel userLoginResponseModel);
//   Future<bool> clearUserProfile();
// }

// class LocalDataSourceImpl implements LocalDataSource {
//   final _className = 'LocalDataSourceImpl';
//   final SharedPreferences sharedPreferences;

//   LocalDataSourceImpl({required this.sharedPreferences});

//   @override
//   UserLoginResponseModel getUserResponseModel() {
//     final jsonString =
//         sharedPreferences.getString(Kstrings.cachedUserResponseKey);
//     if (jsonString != null) {
//       return UserLoginResponseModel.fromJson(jsonString);
//     } else {
//       throw const DatabaseException('Not cached yet');
//     }
//   }

//   @override
//   Future<bool> cacheUserResponse(
//       UserLoginResponseModel userLoginResponseModel) {
//     return sharedPreferences.setString(
//       Kstrings.cachedUserResponseKey,
//       userLoginResponseModel.toJson(),
//     );
//   }

//   @override
//   Future<bool> clearUserProfile() {
//     return sharedPreferences.remove(Kstrings.cachedUserResponseKey);
//   }
// }
