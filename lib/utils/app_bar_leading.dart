import 'dart:io';

import 'package:flutter/material.dart';


class AppbarLeading extends StatelessWidget {
  const AppbarLeading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          height: 35,
          width: 35,
          decoration:  BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Platform.isAndroid? Icons.arrow_back : Icons.arrow_back_ios_new,
            // color: blackColor,
          ),
        ),
      ),
    );
  }
}
