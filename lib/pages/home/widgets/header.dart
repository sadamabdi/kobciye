import 'package:flutter/material.dart';
import 'package:kobciye/constants/styles.dart';

import '../../../constants/images.dart';
import '../../../utils/custom_image.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Somali circle \n Profit',
                style: robotoBold.copyWith(fontSize: 30)
                // style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
            Text(
              'HEL HANTI',
              style: robotoBold.copyWith(
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: const CustomImage(
              path: Images.headerIMg,
            ),
          ),
        ),
      ],
    );
  }
}
