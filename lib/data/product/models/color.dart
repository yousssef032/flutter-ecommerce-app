// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:e_commerce_app/domain/product/entity/color.dart';

class ProductColorModel {
  final String name;
  final String hexcode;

  ProductColorModel({
    required this.name,
    required this.hexcode,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'hexcode': hexcode,
    };
  }

  factory ProductColorModel.fromMap(Map<String, dynamic> map) {
    return ProductColorModel(
      name: map['name'] as String,
      hexcode: map['hexcode'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductColorModel.fromJson(String source) =>
      ProductColorModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension ProductColorXModel on ProductColorModel {
  ProductColorEntity toEntity() {
    return ProductColorEntity(
      name: name,
      hexcode: hexcode,
    );
  }
}
