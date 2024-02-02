import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kobciye/pages/home/widgets/circle_container.dart';
import 'package:kobciye/pages/home/widgets/contact_wdiget.dart';
import 'package:kobciye/pages/home/widgets/oppertunity.widget.dart';

import '../../../constants/app_constants.dart';
import 'rectancle_container.dart';

class ProfitWidget extends StatelessWidget {
  const ProfitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.blue.shade400,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RectancleBox(
            width: screenWidth * 0.5,
            text: 'FAAIDO',
          ),
          const SizedBox(
            height: 30,
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0.0, // No spacing between columns
              mainAxisSpacing: 0.0, // No spacing between rows
            ),
            itemBuilder: (BuildContext context, int index) {
              return Center(child: ProfitCard(profit: profitList[index]));
            },
            itemCount: profitList.length,
          ),
          const SizedBox(
            height: 10,
          ),
          RectancleBox(
            width: screenWidth * 0.5,
            text: 'SI AAD ISU DIIWAN GALISO',
          ),
          const SizedBox(
            height: 10,
          ),
          ContactWidget(screenWidth: screenWidth),
          const SizedBox(
            height: 10,
          ),
          RectancleBox(
            width: screenWidth * 0.5,
            text: 'HEL FURSAD CAJIIB AH',
            isLine: false,
          ),
          OppertunityWidget(screenWidth: screenWidth)
        ],
      ),
    );
  }
}
