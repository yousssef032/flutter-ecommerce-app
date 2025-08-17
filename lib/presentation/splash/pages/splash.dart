import 'package:e_commerce_app/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_app/core/configs/assets/app_vectors.dart';
import 'package:e_commerce_app/core/configs/theme/app_colors.dart';
import 'package:e_commerce_app/presentation/auth/pages/signin.dart';
import 'package:e_commerce_app/presentation/home/pages/home.dart';
import 'package:e_commerce_app/presentation/splash/bloc/splash_cubit.dart';
import 'package:e_commerce_app/presentation/splash/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          // Navigate to home page
          AppNavigator.pushReplacement(
            context,
            SigninPage(), // Replace with your signin page widget
          );
        }
        if (state is Authenticated) {
          // Navigate to home page
          AppNavigator.pushReplacement(
            context,
            HomePage(), // Replace with your home page widget
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(child: SvgPicture.asset(AppVectors.appLogo)),
      ),
    );
  }
}
