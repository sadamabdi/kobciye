
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'countries_search_state.dart';

class CountriesSearchCubit extends Cubit<CountrySearchState> {
  CountriesSearchCubit() : super(CountrySearchState.initial());

  setSearch(String searchText) {
    emit(state.copyWith(searchTerm: searchText));
  }
}
