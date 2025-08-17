import 'package:e_commerce_app/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_app/common/widgets/appbar/app_bar.dart';
import 'package:e_commerce_app/common/widgets/buttons/basic_app_button.dart';
import 'package:e_commerce_app/common/widgets/buttons/basic_reactive_button.dart';
import 'package:e_commerce_app/data/auth/models/user_signin_req.dart';
import 'package:e_commerce_app/domain/auth/usecases/sigin.dart';
import 'package:e_commerce_app/presentation/auth/pages/forgot_password.dart';
import 'package:e_commerce_app/presentation/home/pages/home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/bloc/button/button_state.dart';
import '../../../common/bloc/button/button_state_cubit.dart';

class EnterPasswordPage extends StatelessWidget {
  final UserSigninReq signinReq;
  EnterPasswordPage({required this.signinReq, super.key});
  @override
  final TextEditingController _passwordCon = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 80,
        ),
        child: BlocProvider(
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
                AppNavigator.pushAndRemove(
                  context,
                  HomePage(), // Replace with your home page widget
                );
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _signinText(context),
                const SizedBox(height: 20),
                _passwordField(context),
                const SizedBox(height: 20),
                _continueButton(context),
                SizedBox(
                  height: 20.0,
                ),
                _forgotPassword(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _signinText(BuildContext context) {
    return Text(
      'Sign In',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _passwordCon,
      decoration: InputDecoration(
        hintText: "Enter Password",
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _continueButton(BuildContext context) {
    return Builder(builder: (context) {
      return BasicReactiveButton(
          onPressed: () {
            signinReq.password = _passwordCon.text;
            context
                .read<ButtonStateCubit>()
                .execute(useCase: SigninUseCase(), params: signinReq);
          },
          title: 'Continue');
    });
  }

  Widget _forgotPassword(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
        text: 'Forgot Password? ',
      ),
      TextSpan(
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            AppNavigator.push(
              context,
              ForgotPasswordPage(),
            );
          },
        style: TextStyle(
          // color: Theme.of(context).primaryColor,

          fontWeight: FontWeight.bold,
        ),
        text: 'Reset',
      ),
    ]));
  }
}
