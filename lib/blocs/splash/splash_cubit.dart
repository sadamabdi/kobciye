import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kobciye/blocs/verifyOtp/verify_otp_cubit.dart';

import '../../models/country_model.dart';
import '../../models/custom_error.dart';
import '../../repositories/countries_repository.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final CountriesRepository _countriesRepository;
  SplashCubit({required countriesRepository})
      : _countriesRepository = countriesRepository,
        super(const SplashStateInitial()) {
    loadCountries();
  }

  List<CountryModel>? allCountries;

  CountryModel? initialCountry;

  Future<void> loadCountries() async {
    emit(const SplashStateLoading());

    final result = await _countriesRepository.getCountries();
    result.fold(
      (failure) {
        emit(SplashStateError(CustomError(message: failure.message)));
      },
      (value) {
        allCountries = value;
        getInitialCountry();
        emit(SplashStateLoaded(value));
      },
    );
  }

  void getInitialCountry() {
    initialCountry = allCountries
        ?.firstWhere((CountryModel country) => country.callingCodes == 252);
  }
}
