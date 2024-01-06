import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/countries/country_search/countries_search_cubit.dart';
import '../../../blocs/countries/filter_countries/filter_countries_cubit.dart';
import '../../../blocs/countries/selected_countries/selected_countries_cubit.dart';
import '../../../constants/app_constants.dart';
import '../../../utils/custom_image.dart';

class ShowCountriesList extends StatelessWidget {
  const ShowCountriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FilterCountriesCubit, FilterCountriesState>(
      listener: (context, state) {
      
      },
      builder: (context, state) {
        if (state.filteredCountries.isEmpty) return  const Center(child:  Text('No Countries Found'));
    
        return Expanded(
          child: ListView.separated(
            primary: false,
                shrinkWrap: true,
            scrollDirection: Axis.vertical,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
            itemCount: state.filteredCountries.length,
            itemBuilder:(context, index) => ListTile(
              leading: ClipOval(
                child: CustomImage(path: state.filteredCountries[index].flags.png,width: 40,height: 40,),
              ),
              title: Text(state.filteredCountries[index].name,style: const  TextStyle(fontFamily: AppConstants.fontFamily)),
              onTap: () {
                context.read<SelectedCountriesCubit>().selectedCountry(state.filteredCountries[index]);
                context.read<CountriesSearchCubit>().setSearch('');
                Navigator.pop(context);
              },
            ), 
            ),
        );
      },
    );
  }
}
