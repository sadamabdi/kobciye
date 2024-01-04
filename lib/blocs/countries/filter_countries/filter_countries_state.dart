part of 'filter_countries_cubit.dart';

class FilterCountriesState extends Equatable {
   final List<CountryModel> filteredCountries;

  const FilterCountriesState({required this.filteredCountries});

  factory FilterCountriesState.initial() {
    return const FilterCountriesState(filteredCountries: []);
  }

  @override
  String toString() => 'FilterCountriesState(filteredCountries: $filteredCountries)';

  FilterCountriesState copyWith({
    List<CountryModel>? filteredCountries,
  }) {
    return FilterCountriesState(
      filteredCountries: filteredCountries ?? this.filteredCountries,
    );
  }

  @override
  List<Object> get props => [filteredCountries];
}
