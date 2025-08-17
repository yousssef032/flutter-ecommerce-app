import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecase/usecase.dart';
import 'package:e_commerce_app/domain/category/repository/category.dart';

import '../../../service_locator.dart';
import '../repository/product.dart';

class GetTopSellingUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call(dynamic params) async {
    return await sl<ProductRepository>().getTopSelling();
  }
}
