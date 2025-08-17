import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/category/models/category.dart';
import 'package:e_commerce_app/data/category/source/category_firebase_service.dart';
import 'package:e_commerce_app/domain/category/repository/category.dart';

import '../../../service_locator.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  @override
  Future<Either> getCategories() async {
    var categories = await sl<CategoryFirebaseService>().getCategories();
    return categories.fold((error) {
      return Left(error);
    }, (data) {
      // Assuming data is a QuerySnapshot or similar
      return Right(List.from(data)
          .map((e) => CategoryModel.fromMap(e).toEntity())
          .toList());
    });
  }
}
