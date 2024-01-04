import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:kobciye/blocs/countries/selected_countries/selected_countries_cubit.dart';
import 'package:kobciye/blocs/splash/splash_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kobciye/blocs/countries/countries_list/countries_list_cubit.dart';
import 'package:kobciye/blocs/countries/country_search/countries_search_cubit.dart';
import 'package:kobciye/repositories/countries_repository.dart';

import 'blocs/countries/filter_countries/filter_countries_cubit.dart';
import 'core/data/datasources/remote_data_source.dart';

class StateInjector {
  static late final SharedPreferences _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static final repositoryProviders = <RepositoryProvider>[
    ///network client
    RepositoryProvider<Client>(
      create: (context) => Client(),
    ),
    RepositoryProvider<SharedPreferences>(
      create: (context) => _sharedPreferences,
    ),

    // ///data source repository
    RepositoryProvider<RemoteDataSource>(
      create: (context) => RemoteDataSourceImpl(
        client: context.read<Client>(),
      ),
    ),

    // RepositoryProvider<LocalDataSource>(
    //   create: (context) => LocalDataSourceImpl(
    //     sharedPreferences: context.read(),
    //   ),
    // ),

    RepositoryProvider<CountriesRepository>(
      create: (context) => CountriesRepositoryImp(
        remoteDataSource: context.read<RemoteDataSource>(),
      ),
    ),
  ];

  static final blocProviders = <BlocProvider>[
    BlocProvider<SplashCubit>(
      create: (BuildContext context) => SplashCubit(
        countriesRepository: context.read<CountriesRepository>()
      ),
    ),
    BlocProvider<CountriesSearchCubit>(
      create: (BuildContext context) => CountriesSearchCubit(),
    ),
    BlocProvider<CountriesListCubit>(
      create: (BuildContext context) => CountriesListCubit(
          countriesRepository: context.read<CountriesRepository>()),
    ),
    BlocProvider<FilterCountriesCubit>(
      create: (BuildContext context) => FilterCountriesCubit(
          initialCountries: context.read<CountriesListCubit>().state.countries,
          countriesSearchCubit: BlocProvider.of<CountriesSearchCubit>(context),
          countriesListCubit: BlocProvider.of<CountriesListCubit>(context)),
    ),
    BlocProvider<SelectedCountriesCubit>(
      create: (BuildContext context) => SelectedCountriesCubit(),
    ),
  ];
}
