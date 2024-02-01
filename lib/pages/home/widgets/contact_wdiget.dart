import 'package:flutter/material.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: screenWidth,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'LA XIRIIR',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            '0793987448449',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold),
          ),
          const Text(
            'Waxaa fursadaan ka faaideysan kartaa marka aad bixiso khidmadda diiwan galinta',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
