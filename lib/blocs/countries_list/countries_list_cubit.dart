
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kobciye/models/country_model.dart';
import 'package:kobciye/repositories/countries_repository.dart';

import '../../models/custom_error.dart';

part 'countries_list_state.dart';

class CountriesListCubit extends Cubit<CountriesListState> {
  final CountriesRepository _countriesRepository;
  CountriesListCubit({required  countriesRepository}) :_countriesRepository = countriesRepository ,super(CountriesListState.inital());

  Future<void> getCountries() async {
    emit(state.copyWith(countriesStatus: CountriesStatus.loading));

    final result = await _countriesRepository.getCountries();
     result.fold(
      (failure) {
        print(failure);
        emit(state.copyWith(
          countriesStatus: CountriesStatus.error,
          error: CustomError(code: failure.statusCode.toString(),message: failure.message)
        ));
      },
      (value) {
        print(value);
        emit(state.copyWith(countries: value));
      },
    );
  }
}
