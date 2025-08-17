// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CategoryEntity {
  final String title;
  final String categoryId;
  final String image;

  CategoryEntity({
    required this.title,
    required this.categoryId,
    required this.image,
  });
}
