import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kobciye/blocs/country_search/countries_search_cubit.dart';
import 'package:kobciye/blocs/filter_countries/filter_countries_cubit.dart';
import 'package:kobciye/blocs/selected_countries/selected_countries_cubit.dart';
import 'package:kobciye/utils/custom_image.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: Column(
            children: [
              TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    border:  OutlineInputBorder(),
                    filled: true,
                    labelText: 'phone number',
                    prefixIcon:  Icon(Icons.search)
                      ),
                  validator: (String? value) {
                    return null;
                  },
                 onChanged: (String newValue) {
                  context.read<CountriesSearchCubit>().setSearch(newValue);
                 },
                ),
              const SizedBox(height: 20),
              BlocConsumer<FilterCountriesCubit, FilterCountriesState>(
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
                        title: Text(state.filteredCountries[index].name),
                        onTap: () {
                          context.read<SelectedCountriesCubit>().selectedCountry(state.filteredCountries[index]);
                          context.read<CountriesSearchCubit>().setSearch('');
                          Navigator.pop(context);
                        },
                      ), 
                      ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
