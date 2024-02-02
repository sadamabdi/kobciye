import 'package:flutter/material.dart';
import '../../../constants/app_constants.dart';

class ProfitCard extends StatelessWidget {
  const ProfitCard({super.key, required this.profit});

  final Profit profit;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: screenHeight * 0.15,
          width: screenWidth * 0.3, // Adjust the width as needed
          // Adjust the height as needed
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            border: Border.all(
              color: Theme.of(context)
                  .primaryColor, // Adjust the border color as needed
              width: 5.0, // Adjust the border width as needed
            ), // Adjust the color as needed
          ),
          child: Center(
            child: Text(
              '${profit.percent}%',
              style: const TextStyle(
                color: Colors.white, // Adjust the text color as needed
                fontWeight: FontWeight.bold,
                fontSize: 20.0, // Adjust the font size as needed
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Text(
            profit.text,
            maxLines: 3,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }
}
