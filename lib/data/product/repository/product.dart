import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/product/source/product_firebase_service.dart';
import 'package:e_commerce_app/service_locator.dart';

import '../../../domain/product/repository/product.dart';
import '../models/product.dart';

class ProductRepositoryImpl extends ProductRepository {
  @override
  Future<Either> getTopSelling() async {
    // TODO: implement getTopSelling

    var returnedData = await sl<ProductFirebaseService>().getTopSelling();
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map((e) => ProductModel.fromMap(e).toEntity())
          .toList());
    });
  }

  @override
  Future<Either> getNewIn() async {
    var returnedData = await sl<ProductFirebaseService>().getNewIn();
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map((e) => ProductModel.fromMap(e).toEntity())
          .toList());
    });
  }

  @override
  Future<Either> getProductsByCategoryId(String categoryId) async {
    // TODO: implement getProductsByCategoryId
    var returnedData =
        await sl<ProductFirebaseService>().getProductsByCategoryId(categoryId);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map((e) => ProductModel.fromMap(e).toEntity())
          .toList());
    });
  }
}
