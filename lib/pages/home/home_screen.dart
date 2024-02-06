import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kobciye/blocs/verifyOtp/verify_otp_cubit.dart';
import 'package:kobciye/constants/styles.dart';
import '../../constants/app_constants.dart';
import 'widgets/header.dart';
import 'widgets/profit_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  context.read<VerifyOtpCubit>().logout();
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: HeaderWidget()),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              SliverToBoxAdapter(
                child: Text('HAQBAD /AYUUTO',
                    style: robotoRegular.copyWith(fontSize: 25)),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              const SliverToBoxAdapter(
                child: Text(
                  AppConstants.homeProfitDescription,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 25,
                ),
              ),
              const SliverToBoxAdapter(child: ProfitWidget()),
            ],
          ),
        ));
  }
}
