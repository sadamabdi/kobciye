import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    this.maximumSize = const Size(double.infinity, 52),
    required this.text,
    this.fontSize = 14,
    required this.onPressed,
    this.minimumSize = const Size(double.infinity, 52),
    this.borderRadiusSize = 0,
    this.textColor = Colors.white,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String text;
  final Size maximumSize;
  final Size minimumSize;
  final double fontSize;
  final double borderRadiusSize;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(borderRadiusSize);
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          minimumSize: minimumSize,
          maximumSize: maximumSize,
          backgroundColor: Theme.of(context).primaryColor,
          // primary: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          text,
          style: TextStyle(
              color: textColor,
              fontSize: fontSize,
              height: 1.5,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
