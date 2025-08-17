import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/auth/models/user.dart';
import 'package:e_commerce_app/data/auth/models/user_creation_req.dart';
import 'package:e_commerce_app/data/auth/models/user_signin_req.dart';
import 'package:e_commerce_app/data/auth/source/auth_firebase_service.dart';
import 'package:e_commerce_app/domain/auth/repository/auth.dart';
import 'package:e_commerce_app/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(UserCreationReq user) {
    // TODO: implement signup
    return sl<AuthFirebaseService>().signup(user);
  }

  @override
  Future<Either> getAges() async {
    return await sl<AuthFirebaseService>().getAges();
  }

  @override
  Future<Either> signin(UserSigninReq user) async {
    // TODO: implement signin
    return await sl<AuthFirebaseService>().signin(user);
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) {
    return sl<AuthFirebaseService>().sendPasswordResetEmail(email);
  }

  @override
  Future<bool> isLoggedIn() {
    return sl<AuthFirebaseService>().isLoggedIn();
  }

  @override
  Future<Either> getUser() async {
    var user = await sl<AuthFirebaseService>().getUser();
    return user.fold((error) {
      return Left(error);
    }, (data) {
      print(data);
      return Right(UserModel.fromMap(data).toEntity());
    });
  }
}
