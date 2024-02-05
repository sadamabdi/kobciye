import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kobciye/core/router_name.dart';
import 'package:kobciye/models/verify_model.dart';
import '../../models/custom_error.dart';
import '../../repositories/otp_repository.dart';

part 'verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  final OtpRepository _otpRepository;

  VerifyOtp? _user;

  bool get isLogedIn => _user != null;

  VerifyOtp? get userInfo => _user;
  set user(VerifyOtp userData) => _user = userData;

  VerifyOtpCubit({required otpRepository})
      : _otpRepository = otpRepository,
        super(const VerifyOtpStateInitial()) {
    final result = _otpRepository.getCashedUserInfo();

    result.fold(
      (l) => _user = null,
      (r) {
        user = r;
      },
    );
  }

  void verifyOtp(Map<String, dynamic> body) async {
    emit(const VerifyOtpStateLoading());
    final result = await _otpRepository.verifyOtp(body);
    result.fold(
      (failure) {
        emit(VerifyOtpStateError(CustomError(message: failure.message)));
      },
      (value) {
        _user = value;
        emit(VerifyOtpStateLoaded(value));
      },
    );
  }

  void logout() async {
    final result = await _otpRepository.logOut();
    result.fold(
      (failure) {},
      (value) {
        Navigator.pushNamed(Get.context!, RouteNames.signinScreen);
      },
    );
  }
}
