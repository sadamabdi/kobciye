import 'package:flutter/material.dart';
import 'package:kobciye/constants/images.dart';
import 'package:kobciye/utils/custom_image.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
               CustomImage(path: Images.logo,width: 150,height: 150,),
               SizedBox(height: 30),
               Text('Hubin'),
               Text('Fadlan gali code loo soo diray')
            ],
          ),
        ),
      ),
    );
  }
}