import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecase/usecase.dart';
import 'package:e_commerce_app/domain/auth/entity/user.dart';
import 'package:e_commerce_app/domain/auth/repository/auth.dart';
import 'package:e_commerce_app/service_locator.dart';

class GetUserUseCase implements UseCase<Either, dynamic> {
  Future<Either> call(params) async {
    return await sl<AuthRepository>().getUser();
  }
}
