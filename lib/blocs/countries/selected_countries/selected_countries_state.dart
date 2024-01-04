part of 'selected_countries_cubit.dart';

class SelectedCountryState extends Equatable {
  final CountryModel? selectedCountry;

  const SelectedCountryState({required this.selectedCountry});

  factory SelectedCountryState.inital() {
    return const SelectedCountryState(selectedCountry: null);
  }


  @override
  String toString() => 'SelectedCountryState(selectedCountry: $selectedCountry)';

  SelectedCountryState copyWith({
    CountryModel? selectedCountry,
  }) {
    return SelectedCountryState(
      selectedCountry: selectedCountry ?? this.selectedCountry,
    );
  }

  @override
  List<Object> get props => [selectedCountry ?? []];
}
