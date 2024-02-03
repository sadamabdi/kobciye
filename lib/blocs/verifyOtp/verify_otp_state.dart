part of 'verify_otp_cubit.dart';


class VerifyOtpState extends Equatable {
  const VerifyOtpState();

  @override
  List<Object> get props => [];
}

class VerifyOtpStateInitial extends VerifyOtpState {
  const VerifyOtpStateInitial();
}

class VerifyOtpStateLoading extends VerifyOtpState {
  const VerifyOtpStateLoading();
}

class VerifyOtpStateError extends VerifyOtpState {
  final CustomError error;
  const VerifyOtpStateError(this.error);
}

class VerifyOtpStateLoaded extends VerifyOtpState {
  final VerifyOtp token;
  const VerifyOtpStateLoaded(this.token);
}
