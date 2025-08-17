import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecase/usecase.dart';
import 'package:e_commerce_app/domain/category/repository/category.dart';

import '../../../service_locator.dart';
import '../repository/product.dart';

class GetProductsByCategoryIdUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call(String categoryId) async {
    return await sl<ProductRepository>().getProductsByCategoryId(categoryId);
  }
}
