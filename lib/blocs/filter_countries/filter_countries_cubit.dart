
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kobciye/blocs/countries_list/countries_list_cubit.dart';
import 'package:kobciye/blocs/country_search/countries_search_cubit.dart';
import 'package:kobciye/models/country_model.dart';

part 'filter_countries_state.dart';

class FilterCountriesCubit extends Cubit<FilterCountriesState> {

  late StreamSubscription countriesSearchSubscription;
  late StreamSubscription countriesListSubscription;

   final List<CountryModel> initialCountries;

  final CountriesSearchCubit countriesSearchCubit;
  final CountriesListCubit countriesListCubit;
  FilterCountriesCubit({required this.countriesSearchCubit,required this.countriesListCubit,required this.initialCountries}) : super(FilterCountriesState(filteredCountries: initialCountries)){
        countriesSearchSubscription = countriesSearchCubit.stream.listen((CountrySearchState countrySearchState) {
      setFiltersTodo();
    });
    countriesListSubscription = countriesListCubit.stream.listen((CountriesListState countriesState) {
      setFiltersTodo();
    });
  }

   void setFiltersTodo() {
     List<CountryModel> filteredCountries = countriesListCubit.state.countries;

     if(countriesSearchCubit.state.searchTerm.isNotEmpty) {
       filteredCountries = filteredCountries.where((CountryModel country) => country.title.toLowerCase().contains(countriesSearchCubit.state.searchTerm)).toList();
     }

     emit(state.copyWith(filteredCountries: filteredCountries));
   }

   @override
  Future<void> close() {
    countriesListSubscription.cancel();
    countriesSearchSubscription.cancel();
    return super.close();
  }
}
