part of 'countries_list_cubit.dart';

enum CountriesStatus {
  initial,
  loading,
  loaded,
  error,
}

class CountriesListState extends Equatable {

  final CountriesStatus countriesStatus;
  final List<CountryModel> countries;
  final CustomError error;

  const CountriesListState({required this.countries,required this.countriesStatus,required this.error});

  factory CountriesListState.inital() {
    return const  CountriesListState(countries: [], countriesStatus: CountriesStatus.initial, error:  CustomError());
  }



  @override
  String toString() => 'CountriesState(countriesStatus: $countriesStatus, countries: $countries, error: $error)';

  CountriesListState copyWith({
    CountriesStatus? countriesStatus,
    List<CountryModel>? countries,
    CustomError? error,
  }) {
    return CountriesListState(
      countriesStatus: countriesStatus ?? this.countriesStatus,
      countries: countries ?? this.countries,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [countriesStatus, countries, error];
}
