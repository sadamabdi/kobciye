part of 'countries_search_cubit.dart';

class CountrySearchState extends Equatable {
  final String searchTerm;

  const CountrySearchState({required this.searchTerm});

  factory CountrySearchState.initial() {
    return const CountrySearchState(searchTerm: '');
  }

  @override
  String toString() => 'CountrySearch(searchTerm: $searchTerm)';

  CountrySearchState copyWith({
    String? searchTerm,
  }) {
    return CountrySearchState(
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }

  @override
  List<Object> get props => [searchTerm];
}
