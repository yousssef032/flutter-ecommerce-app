import 'package:e_commerce_app/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_app/common/widgets/appbar/app_bar.dart';
import 'package:e_commerce_app/common/widgets/buttons/basic_app_button.dart';
import 'package:e_commerce_app/presentation/auth/pages/enter_password.dart';
import 'package:e_commerce_app/presentation/auth/pages/password_reset_email.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/bloc/button/button_state.dart';
import '../../../common/bloc/button/button_state_cubit.dart';
import '../../../common/widgets/buttons/basic_reactive_button.dart';
import '../../../domain/auth/usecases/send_password_reset_email.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});
  final TextEditingController _emailCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: BlocProvider(
        create: (context) => ButtonStateCubit(),
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonFailureState) {
              var snackbar = SnackBar(
                content: Text(state.errorMessage),
                behavior: SnackBarBehavior.floating,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            }
            if (state is ButtonSuccessState) {
              AppNavigator.pushReplacement(
                context,
                PasswordResetEmailPage(),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _forgotPasswordText(context),
                const SizedBox(height: 20),
                _emailField(context),
                const SizedBox(height: 20),
                _continueButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _forgotPasswordText(BuildContext context) {
    return Text(
      'Forgot Password',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _emailCon,
      decoration: InputDecoration(
        hintText: "Enter Email",
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _continueButton(BuildContext context) {
    return Builder(builder: (context) {
      return BasicReactiveButton(
          onPressed: () {
            context.read<ButtonStateCubit>().execute(
                useCase: SendPasswordResetEmail(), params: _emailCon.text);
          },
          title: 'Continue');
    });
  }
}
