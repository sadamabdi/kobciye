import 'package:flutter/material.dart';
import 'package:kobciye/pages/home/widgets/rectancle_container.dart';
import 'package:kobciye/utils/utitls.dart';

import '../../../constants/app_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class OppertunityWidget extends StatelessWidget {
  const OppertunityWidget({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    void performActionAndShowDialer() async {
      String phoneNumber = '123456789';

      String dialerUrl = 'tel:$phoneNumber';
      // ignore: deprecated_member_use
      if (await canLaunch(dialerUrl)) {
        // ignore: deprecated_member_use
        await launch(dialerUrl);
      } else {
        Utils.showCustomDialog(context,
            child: Text('Could not launch $dialerUrl'));
      }
    }

    return Container(
      color: Colors.white,
      width: screenWidth,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            opportunities.header,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            opportunities.subHeader,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Column(
            children: List.generate(
                opportunities.list.length,
                (index) => ListTile(
                      leading: Text(
                        '${index + 1}.',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      title: Text(opportunities.list[index]),
                    )),
          ),
          const SizedBox(
            height: 50,
          ),
          RectancleBox(
            width: screenWidth * 0.3,
            text: 'Bixi \$1',
            isLine: false,
            onClick: () => performActionAndShowDialer(),
          )
        ],
      ),
    );
  }
}
