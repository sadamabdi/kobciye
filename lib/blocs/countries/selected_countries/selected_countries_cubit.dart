import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kobciye/models/country_model.dart';

part 'selected_countries_state.dart';

class SelectedCountriesCubit extends Cubit<SelectedCountryState> {

  final CountryModel? initialCountry;
   
  SelectedCountriesCubit({required this.initialCountry}) : super(SelectedCountryState(selectedCountry: initialCountry));

  

  void selectedCountry(CountryModel newSelectedCountry) {
    emit(state.copyWith(selectedCountry: newSelectedCountry));
  }
}
