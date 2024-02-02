import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';
import 'widgets/header.dart';
import 'widgets/profit_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: HeaderWidget()),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                'HAQBAD /AYUUTO',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                AppConstants.homeProfitDescription,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 25,
              ),
            ),
            SliverToBoxAdapter(child: ProfitWidget()),
          ],
        ),
      )),
    );
  }
}
