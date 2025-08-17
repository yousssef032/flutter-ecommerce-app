// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:e_commerce_app/data/product/models/color.dart';
import 'package:e_commerce_app/domain/product/entity/product.dart';

class ProductModel {
  final String categoryId;
  final List<ProductColorModel> colors;
  final Timestamp createdDate;
  final num discountPrice;
  final int gender;
  final List<String> images;
  final num price;
  final List<String> sizes;
  final String productId;
  final num salesNumber;
  final String title;

  ProductModel({
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

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      categoryId: map['categoryId'] as String,
      colors: List<ProductColorModel>.from(
          map['colors'].map((e) => ProductColorModel.fromMap(e))),
      createdDate: map['createdDate'] as Timestamp,
      discountPrice: map['discountPrice'] as num,
      gender: map['gender'] as int,
      images: List<String>.from((map['images'].map((e) => e as String))),
      price: map['price'] as num,
      sizes: List<String>.from((map['sizes'].map((e) => e as String))),
      productId: map['productId'] as String,
      salesNumber: map['salesNumber'] as num,
      title: map['title'] as String,
    );
  }
}

extension ProductXModel on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      categoryId: categoryId,
      colors: colors.map((color) => color.toEntity()).toList(),
      createdDate: createdDate,
      discountPrice: discountPrice,
      gender: gender,
      images: images,
      price: price,
      sizes: sizes,
      productId: productId,
      salesNumber: salesNumber,
      title: title,
    );
  }
}
