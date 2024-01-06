import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/countries/country_search/countries_search_cubit.dart';

class SearchTextfield extends StatelessWidget {
  const SearchTextfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        autocorrect: false,
        decoration: const InputDecoration(
          border:  OutlineInputBorder(),
          filled: true,
          labelText: 'Search country',
          prefixIcon:  Icon(Icons.search)
            ),
        validator: (String? value) {
          return null;
        },
       onChanged: (String newValue) {
        context.read<CountriesSearchCubit>().setSearch(newValue);
       },
      );
  }
}
