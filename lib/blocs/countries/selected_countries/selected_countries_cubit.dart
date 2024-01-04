import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kobciye/models/country_model.dart';

part 'selected_countries_state.dart';

class SelectedCountriesCubit extends Cubit<SelectedCountryState> {
  SelectedCountriesCubit() : super(SelectedCountryState.inital());

  void selectedCountry(CountryModel newSelectedCountry) {
    emit(state.copyWith(selectedCountry: newSelectedCountry));
  }
}
