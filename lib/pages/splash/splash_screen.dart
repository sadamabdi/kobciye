import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kobciye/blocs/splash/splash_cubit.dart';
import 'package:kobciye/blocs/verifyOtp/verify_otp_cubit.dart';
import 'package:kobciye/constants/images.dart';
import 'package:kobciye/core/router_name.dart';
import 'package:kobciye/utils/custom_image.dart';
import 'widget/setting_error_message.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final verifyOtp = context.read<VerifyOtpCubit>();
    return Scaffold(
      body: Builder(builder: (context) {
        return BlocConsumer<SplashCubit, SplashState>(
          listener: (context, state) {
            if (state is SplashStateLoaded) {
              if (verifyOtp.isLogedIn) {
                Navigator.pushReplacementNamed(context, RouteNames.homeScreen);
              } else {
                Navigator.pushReplacementNamed(
                    context, RouteNames.signinScreen);
              }
            }
          },
          builder: (context, state) {
            if (state is SplashStateError) {
              return SettingErrorWidget(message: state.error.message);
            }
            return const Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImage(path: Images.logo, height: 200),
                SizedBox(height: 20),
                CircularProgressIndicator()
              ],
            ));
          },
        );
      }),
    );
  }
}
