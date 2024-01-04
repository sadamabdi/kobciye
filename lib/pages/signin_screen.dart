import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kobciye/blocs/selected_countries/selected_countries_cubit.dart';
import 'package:kobciye/utils/custom_button.dart';
import '../blocs/countries_list/countries_list_cubit.dart';
import '../constants/images.dart';
import '../core/router_name.dart';
import '../utils/custom_image.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              const CustomImage(path: Images.logo, height: 200),
              const SizedBox(height: 20.0),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'phone number',
                  prefixIcon: GestureDetector(
                    onTap: () {
                      context.read<CountriesListCubit>().getCountries();
                      Navigator.pushNamed(context, RouteNames.countriesScreen);
                    },
                    child: SizedBox(
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BlocBuilder<SelectedCountriesCubit,
                            SelectedCountryState>(
                          builder: (context, state) {
                            return Row(
                              children: [
                                CustomImage(
                                  path: state.selectedCountry?.flags.png ??
                                      Images.logo,
                                  height: 25,
                                  width: 30,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(width: 5),
                                Text(state.selectedCountry?.callingCodes == null
                                    ? ''
                                    : '+${state.selectedCountry?.callingCodes[0]}'),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                validator: (String? value) {
                  return null;
                },
                onSaved: (String? value) {},
              ),
              const SizedBox(height: 30.0),
              PrimaryButton(
                text: 'Sign In',
                onPressed: () {},
                borderRadiusSize: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
