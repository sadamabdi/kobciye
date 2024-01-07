part of 'send_otp_cubit.dart';

class SendOtpState extends Equatable {
  const SendOtpState();

  @override
  List<Object> get props => [];
}

class SendOtpStateInitial extends SendOtpState {
  const SendOtpStateInitial();
}

class SendOtpStateLoading extends SendOtpState {
  const SendOtpStateLoading();
}

class SendOtpStateError extends SendOtpState {
  final CustomError error;
  const SendOtpStateError(this.error);
}

class SendOtpStateLoaded extends SendOtpState {
  final OtpModel otpData;
  const SendOtpStateLoaded(this.otpData);
}
