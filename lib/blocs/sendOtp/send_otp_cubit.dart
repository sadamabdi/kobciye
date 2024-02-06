import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/data/datasources/api_checker.dart';
import '../../models/custom_error.dart';
import '../../models/verification_model.dart';
import '../../repositories/otp_repository.dart';

part 'send_otp_state.dart';

class SendOtpCubit extends Cubit<SendOtpState> {
  final OtpRepository _otpRepository;
  SendOtpCubit({required otpRepository})
      : _otpRepository = otpRepository,
        super(const SendOtpStateInitial());

  OtpModel? otpResponse;
  void sendOtp() async {
    emit(const SendOtpStateLoading());

    final result = await _otpRepository.sendOtp();
    result.fold(
      (failure) {
        if (!ApiChecker.checkApi(failure)) {
          emit(SendOtpStateError(CustomError(message: failure.message)));
        }
      },
      (value) {
        otpResponse = value;
        emit(SendOtpStateLoaded(value));
      },
    );
  }
}
