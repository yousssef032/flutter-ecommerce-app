import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/auth/models/user_creation_req.dart';
import 'package:e_commerce_app/data/auth/models/user_signin_req.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(UserCreationReq user);
  Future<Either> getAges();
  Future<Either> signin(UserSigninReq user);
  Future<Either> sendPasswordResetEmail(String email);
  Future<bool> isLoggedIn();
  Future<Either> getUser();
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  @override
  Future<Either> signup(UserCreationReq user) async {
    try {
      var returnedData =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );

      // Create user document in Firestore
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(returnedData.user!.uid)
          .set({
        'firstName': user.firstName,
        'lastName': user.lastName,
        'email': user.email,
        'gender': user.gender,
        'age': user.age,
        'image': returnedData.user!.photoURL,
        'userId': returnedData.user!.uid
      });

      return Right(
        'signup successful',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Left('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return Left('The account already exists for that email.');
      } else {
        return Left('An unknown error occurred: ${e.message}');
      }
    } catch (e) {
      // Catch any other errors (including Firestore errors)
      return Left('Failed to create user: ${e.toString()}');
    }
  }

  @override
  Future<Either> getAges() async {
    try {
      var returnedData =
          await FirebaseFirestore.instance.collection('Ages').get();

      return Right(returnedData.docs);
    } catch (e) {
      return Left('An unknown error occurred: ${e.toString()}');
    }
  }

  @override
  Future<Either> signin(UserSigninReq user) async {
    try {
      var returnedData = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );

      return Right(
        'signin successful',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        return Left('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return Left('The password is invalid.');
      } else {
        return Left('An unknown error occurred: ${e.message}');
      }
    } catch (e) {
      // Catch any other errors (including Firestore errors)
      return Left('Failed to create user: ${e.toString()}');
    }
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return Right('Password reset email sent successfully');
    } catch (e) {
      return Left('Failed to send password reset email: ${e.toString()}');
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      return user != null;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Either> getUser() async {
    try {
      var currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        var userData = await FirebaseFirestore.instance
            .collection('Users')
            .doc(currentUser.uid)
            .get()
            .then((value) => value.data());
        return Right(userData);
      } else {
        return Left('No user is currently logged in.');
      }
    } catch (e) {
      return Left('Failed to retrieve user: ${e.toString()}');
    }
  }
}
