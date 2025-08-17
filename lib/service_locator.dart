import 'package:e_commerce_app/data/auth/repository/auth_repository_impl.dart';
import 'package:e_commerce_app/data/auth/source/auth_firebase_service.dart';
import 'package:e_commerce_app/data/category/repository/category.dart';
import 'package:e_commerce_app/data/category/source/category_firebase_service.dart';
import 'package:e_commerce_app/data/product/repository/product.dart';
import 'package:e_commerce_app/data/product/source/product_firebase_service.dart';
import 'package:e_commerce_app/domain/auth/repository/auth.dart';
import 'package:e_commerce_app/domain/auth/usecases/get_ages.dart';
import 'package:e_commerce_app/domain/auth/usecases/get_user.dart';
import 'package:e_commerce_app/domain/auth/usecases/is_logged_in.dart';
import 'package:e_commerce_app/domain/auth/usecases/send_password_reset_email.dart';
import 'package:e_commerce_app/domain/auth/usecases/sigin.dart';
import 'package:e_commerce_app/domain/auth/usecases/signup.dart';
import 'package:e_commerce_app/domain/category/repository/category.dart';
import 'package:e_commerce_app/domain/category/usecases/get_categories.dart';
import 'package:e_commerce_app/domain/product/repository/product.dart';
import 'package:e_commerce_app/domain/product/usecases/get_new_in.dart';
import 'package:e_commerce_app/domain/product/usecases/get_products_by_category_id.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import 'domain/product/usecases/get_top_selling.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Register services
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<CategoryFirebaseService>(CategoryFirebaseServiceImpl());
  sl.registerSingleton<ProductFirebaseService>(ProductFirebaseServiceImpl());

  // Register repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<CategoryRepository>(CategoryRepositoryImpl());
  sl.registerSingleton<ProductRepository>(ProductRepositoryImpl());

  // Usecases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<GetAgesUseCase>(GetAgesUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<SendPasswordResetEmail>(SendPasswordResetEmail());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<GetUserUseCase>(GetUserUseCase());
  sl.registerSingleton<GetCategories>(GetCategories());
  sl.registerSingleton<GetTopSellingUseCase>(GetTopSellingUseCase());
  sl.registerSingleton<GetNewInUseCase>(GetNewInUseCase());
  sl.registerSingleton<GetProductsByCategoryIdUseCase>(
      GetProductsByCategoryIdUseCase());
}
