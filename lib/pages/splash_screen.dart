import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:kobciye/constants/images.dart';
import 'package:kobciye/utils/custom_image.dart';

import '../constants/dimensions.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
                  filled: true,
                  labelText: 'phone number',
                  prefixIcon: SizedBox(
                    child: Row(
                      children: [
                        Container(
                            width: 85,
                            height: 50,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft:
                                    Radius.circular(Dimensions.radiusSmall),
                                bottomLeft:
                                    Radius.circular(Dimensions.radiusSmall),
                              ),
                            ),
                            margin: const EdgeInsets.only(right: 0),
                            padding: const EdgeInsets.only(left: 5),
                            child: const Center(
                              child: CountryCodePicker(
                                onChanged: print,
                                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                initialSelection: 'IT',
                                favorite: ['+39', 'FR'],
                                // optional. Shows only country name and flag
                                showCountryOnly: false,
                                // optional. Shows only country name and flag when popup is closed.
                                showOnlyCountryWhenClosed: false,
                                // optional. aligns the flag and the Text left
                                alignLeft: false,
                              ),
                            )),
                        Container(
                          height: 20,
                          width: 2,
                          color: Theme.of(context).disabledColor,
                        )
                      ],
                    ),
                  ),
                ),
                validator: (String? value) {
                  return null;
                },
                onSaved: (String? value) {},
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
