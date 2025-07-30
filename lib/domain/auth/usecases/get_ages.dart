import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecase/usecase.dart';
import 'package:e_commerce_app/data/auth/models/user_creation_req.dart';
import 'package:e_commerce_app/domain/auth/repository/auth.dart';
import 'package:e_commerce_app/service_locator.dart';

class GetAgesUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call(dynamic params) async {
    return sl<AuthRepository>().getAges();
  }
}
