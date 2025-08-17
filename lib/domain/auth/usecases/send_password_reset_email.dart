import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecase/usecase.dart';
import 'package:e_commerce_app/data/auth/models/user_creation_req.dart';
import 'package:e_commerce_app/domain/auth/repository/auth.dart';
import 'package:e_commerce_app/service_locator.dart';

import '../../../data/auth/models/user_signin_req.dart';

class SendPasswordResetEmail implements UseCase<Either, String> {
  @override
  Future<Either> call(String params) async {
    return sl<AuthRepository>().sendPasswordResetEmail(params);
  }
}
