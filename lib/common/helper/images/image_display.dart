import 'package:e_commerce_app/core/constants/app_urls.dart';

class ImageDisplayHelper {
  static String generateCategoryImageUrl(String title) {
    return AppUrl.categoryImage + title + AppUrl.alt;
  }

  static String generateProductImageUrl(String title) {
    return AppUrl.productImage + title + AppUrl.alt;
  }
}
