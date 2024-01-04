part of 'splash_cubit.dart';

class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class SplashStateInitial extends SplashState {
  const SplashStateInitial();
}

class SplashStateLoading extends SplashState {
  const SplashStateLoading();
}

class SplashStateError extends SplashState {
  final CustomError error;
  const SplashStateError(this.error);
}

class SplashStateLoaded extends SplashState {
  final List<CountryModel> settingModel;
  const SplashStateLoaded(this.settingModel);
}
