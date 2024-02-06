import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kobciye/blocs/verifyOtp/verify_otp_cubit.dart';
import 'package:kobciye/core/error/failure.dart';

class ApiChecker {
  static bool checkApi(
    Failure response,
  ) {
    if (response.statusCode == 401) {
      Get.context!.read<VerifyOtpCubit>().logout();
      return true;
    } else {
      return false;
    }
  }
}
