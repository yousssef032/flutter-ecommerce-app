import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/category/repository/category.dart';

import '../../../service_locator.dart';

class GetCategories {
  Future<Either> call() async {
    return await sl<CategoryRepository>().getCategories();
  }
}
