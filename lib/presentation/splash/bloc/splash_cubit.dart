import 'package:e_commerce_app/presentation/splash/bloc/splash_state.dart';
import 'package:e_commerce_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/auth/usecases/is_logged_in.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 2));
    var isLoggedIn = await sl<IsLoggedInUseCase>().call(null);
    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(Unauthenticated());
    }
  }
}
