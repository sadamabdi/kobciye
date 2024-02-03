import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kobciye/blocs/sendOtp/send_otp_cubit.dart';
import 'package:kobciye/blocs/verifyOtp/verify_otp_cubit.dart';
import 'package:kobciye/constants/dimensions.dart';
import 'package:kobciye/constants/images.dart';
import 'package:kobciye/core/router_name.dart';
import 'package:kobciye/utils/custom_button.dart';
import 'package:kobciye/utils/custom_image.dart';
import 'package:kobciye/utils/utitls.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otpValue = '';
  @override
  Widget build(BuildContext context) {
    final otpResponse = context.read<SendOtpCubit>().otpResponse;
    return SafeArea(
      child: BlocListener<VerifyOtpCubit, VerifyOtpState>(
        listener: (BuildContext context, VerifyOtpState state) {
          if (state is VerifyOtpStateLoading) {
            Utils.loadingDialog(context);
          }
          if (state is VerifyOtpStateError) {
            Utils.closeDialog(context);
            Utils.errorDialog(context, state.error);
          }
          if (state is VerifyOtpStateLoaded) {
            Utils.closeDialog(context);
            Navigator.pushReplacementNamed(context, RouteNames.homeScreen);
          }
        },
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            alignment: Alignment.topCenter,
            child: ListView(
              children: [
                const CustomImage(
                  path: Images.logo,
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 15),
                Text(
                  'Hubin',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Theme.of(context).primaryColor),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Fadlan gali code loo soo diray',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 5),
                Text(
                  otpResponse!.to,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: Dimensions.paddingSizeDefault),
                OTPTextField(
                    length: 6,
                    width: MediaQuery.of(context).size.width,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: 50,
                    fieldStyle: FieldStyle.box,
                    keyboardType: TextInputType.number,
                    otpFieldStyle: OtpFieldStyle(
                      focusBorderColor: Theme.of(context).primaryColor,
                    ),
                    // outlineBorderRadius: 15,
                    style: const TextStyle(fontSize: 17),
                    onChanged: (pin) {},
                    onCompleted: (pin) {
                      otpValue = pin;
                    }),
                const SizedBox(
                  height: 50,
                ),
                PrimaryButton(
                    text: 'Hubi',
                    borderRadiusSize: 15,
                    onPressed: () {
                      Map<String, dynamic> body = {
                        "mobileNumber": otpResponse.to.toString(),
                        "code": otpValue,
                        "verificationId": otpResponse.verificationId
                      };
                      print(body);
                      context.read<VerifyOtpCubit>().verifyOtp(body);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
