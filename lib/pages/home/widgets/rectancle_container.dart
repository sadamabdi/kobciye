import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RectancleBox extends StatelessWidget {
  const RectancleBox(
      {super.key,
      required this.width,
      required this.text,
      this.isLine = true,
      this.onClick});

  final double width;
  final String text;
  final bool isLine;
  final Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onClick,
          child: Container(
            padding: const EdgeInsets.all(12),
            alignment: Alignment.centerLeft,
            width: width,
            color: Theme.of(context).primaryColor,
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        if (isLine)
          Expanded(
            child: Container(
              height: 2, // Set the height of the line
              color: Colors.white, // Set the color of the line
            ),
          ),
      ],
    );
  }
}
