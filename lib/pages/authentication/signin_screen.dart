import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kobciye/blocs/countries/selected_countries/selected_countries_cubit.dart';
import 'package:kobciye/blocs/sendOtp/send_otp_cubit.dart';
import 'package:kobciye/models/country_model.dart';
import 'package:kobciye/utils/custom_button.dart';
import 'package:kobciye/utils/utitls.dart';
import '../../constants/images.dart';
import '../../core/router_name.dart';
import '../../utils/custom_image.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CountryModel? selectedCountry =
        context.watch<SelectedCountriesCubit>().state.selectedCountry;
    String? phoneNumber;
    submitButton(value) {
      if (value == null) {
        Utils.showSnackBar(context, 'Please enter a phone number');
        return;
      }
      if (selectedCountry == null) {
        Utils.showSnackBar(context, 'Please choose a country');
        return;
      }
      context.read<SendOtpCubit>().sendOtp();
    }

    return MultiBlocListener(
      listeners: [
        BlocListener<SendOtpCubit, SendOtpState>(
          listener: (context, state) {
            if (state is SendOtpStateLoading) {
              Utils.loadingDialog(context, message: 'loading');
            }
            if (state is SendOtpStateError) {
              Utils.closeDialog(context);
              Utils.showSnackBar(context, state.error.message);
            }
            if (state is SendOtpStateLoaded) {
              Utils.closeDialog(context);
              Navigator.pushNamed(context, RouteNames.otpScreen);
            }
          },
        )
      ],
      child: Scaffold(
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
                    prefixIcon: selectedCountry != null
                        ? GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteNames.countriesScreen);
                            },
                            child: SizedBox(
                              width: 100,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    CustomImage(
                                      path: selectedCountry.flagUrl1,
                                      height: 25,
                                      width: 30,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(width: 5),
                                    Text('+${selectedCountry.callingCodes}'),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : null,
                  ),
                  validator: (String? value) {
                    return null;
                  },
                  onChanged: (String value) {
                    phoneNumber = value;
                  },
                  onSaved: (String? value) => submitButton,
                ),
                const SizedBox(height: 30.0),
                PrimaryButton(
                  text: 'Sign In',
                  onPressed: () => submitButton(phoneNumber),
                  borderRadiusSize: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
