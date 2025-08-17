import 'package:e_commerce_app/domain/auth/entity/user.dart';

abstract class UserInfoDisplayState {}

class UserInfoLoading extends UserInfoDisplayState {}

class UserInfoLoaded extends UserInfoDisplayState {
  final UserEntity user;

  UserInfoLoaded(this.user);
}

class LoadUserInfoFailure extends UserInfoDisplayState {}
