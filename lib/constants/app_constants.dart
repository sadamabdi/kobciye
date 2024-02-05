import 'package:flutter/material.dart';

class AppConstants {
  static const String appName = "Kobciye";
  static const String splashTitle = "Welcome Shodog primary & Secondary School";

  static const String cachedUserResponseKey = "cachhUserResponse";
  

  static const String fontFamily = 'Roboto';

  static const String homeProfitDescription =
      'Si aad u hesho Faaido joogto ah taas oo ka bilaabmaysa marka aad is diiwan galiso oo aad bixio \$1 khidmadda diiwan galinta waxaa heli doontaa';
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class Profit {
  final int percent;
  final String text;
  const Profit({required this.percent, required this.text});
}

class NavigationService { 
  static GlobalKey<NavigatorState> navigatorKey = 
  GlobalKey<NavigatorState>();
}


// List of Profit objects
List<Profit> profitList = const [
  Profit(percent: 94, text: 'Faaido Bille ah'),
  Profit(percent: 0, text: 'Khasaare'),
  Profit(percent: 85, text: 'Saaxibada oo guulaysta'),
  Profit(percent: 99, text: 'Qoyskaaga oo guulaysta'),
];

class Opportunity {
  final String header;
  final String subHeader;
  final List<String> list;

  Opportunity(this.header,this.subHeader, this.list);
}

Opportunity opportunities = Opportunity(
  'INYAR OO AAD BIXISAA KU HEL HANTI FARO BADAN!',
  'GUDAHA MARKA AAD GASHO WAXAA HELEYSAA',
  [
    'Muuqaalo iyo casharo sharaxaya sida sida aad ku heleyso faaido faaido intaas laeg',
    'Number iyo macluumaadka shirkadda',
    'Cadeymo iyo sida loo faaidaayo'
  ],
);
