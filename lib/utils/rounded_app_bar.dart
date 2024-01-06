import 'package:flutter/material.dart';
import 'app_bar_leading.dart';

class RoundedAppBar extends AppBar {
  final String? titleText;
  final bool textCenter;
  final Color? bgColor;
  final Color textColor;
  final void Function()? onTap;

  RoundedAppBar({
    this.titleText,
    this.textColor = Colors.black,
    this.bgColor,
    this.textCenter = false,
    this.onTap,
    Key? key,
  }) : super(
          key: key,
          titleSpacing: 0,
          backgroundColor: bgColor,
          leading: const AppbarLeading(),
          centerTitle: textCenter,
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
              color: textColor, fontSize: 18, fontWeight: FontWeight.w600),
          title: titleText != null ? Text(titleText) : null,
          elevation: 0.0,
          automaticallyImplyLeading: false,
        );
}
