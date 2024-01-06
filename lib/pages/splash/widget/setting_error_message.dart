import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:kobciye/blocs/splash/splash_cubit.dart';
import 'package:kobciye/constants/dimensions.dart';

class SettingErrorWidget extends StatelessWidget {
  const SettingErrorWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style:  TextStyle(color: Colors.red, fontSize: Dimensions.paddingSizeLarge),
          ),
          TextButton(
            onPressed: () {
              context.read<SplashCubit>().loadCountries();
            },
            child: const Icon(
              Icons.refresh_outlined,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
