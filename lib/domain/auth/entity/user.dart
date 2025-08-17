// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserEntity {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;
  final int gender;
  final String image;

  UserEntity({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.image,
  });
}
