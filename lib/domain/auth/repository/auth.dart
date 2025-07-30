import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/auth/models/user_creation_req.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<Either> signup(UserCreationReq user);
  Future<Either> getAges();
}
