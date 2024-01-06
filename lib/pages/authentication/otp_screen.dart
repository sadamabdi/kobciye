import 'package:flutter/material.dart';
import 'package:kobciye/constants/dimensions.dart';
import 'package:kobciye/constants/images.dart';
import 'package:kobciye/utils/custom_image.dart';
import 'package:kobciye/utils/rounded_app_bar.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
   OtpFieldController otpController = OtpFieldController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RoundedAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomImage(
              path: Images.logo,
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 30),
            const Text('Hubin'),
            const Text('Fadlan gali code loo soo diray'),
            const SizedBox(height: Dimensions.paddingSizeDefault),
           OTPTextField(
            controller: otpController,
            length: 5,
            width: MediaQuery.of(context).size.width,
            textFieldAlignment: MainAxisAlignment.spaceAround,
            fieldWidth: 60,
            fieldStyle: FieldStyle.box,
            keyboardType: TextInputType.number,
            // outlineBorderRadius: 15,
            style: const TextStyle(fontSize: 17),
            onChanged: (pin) {
              
            },
            onCompleted: (pin) {
             
            }),
      
    
          ],
        ),
      ),
    );
  }
}
