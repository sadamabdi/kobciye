import 'package:flutter/material.dart';
import '../../utils/rounded_app_bar.dart';
import 'widgets/search_field.dart';
import 'widgets/show_countries_list.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: RoundedAppBar(titleText: 'Countries',textCenter: true,),
      body:const Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        child: Column(
          children: [
             SearchTextfield(),
             SizedBox(height: 20),
             ShowCountriesList(),
          ],
        ),
      ),
    );
  }
}
