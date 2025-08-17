// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/domain/product/entity/color.dart';

class ProductEntity {
  final String categoryId;
  final List<ProductColorEntity> colors;
  final Timestamp createdDate;
  final num discountPrice;
  final int gender;
  final List<String> images;
  final num price;
  final List<String> sizes;
  final String productId;
  final num salesNumber;
  final String title;

  ProductEntity({
    required this.categoryId,
    required this.colors,
    required this.createdDate,
    required this.discountPrice,
    required this.gender,
    required this.images,
    required this.price,
    required this.sizes,
    required this.productId,
    required this.salesNumber,
    required this.title,
  });
}
