import '../../../domain/product/entity/product.dart';

abstract class ProductsDisplayState {}

class ProductsLoading extends ProductsDisplayState {}

class ProductsLoaded extends ProductsDisplayState {
  final List<ProductEntity> products;

  ProductsLoaded({required this.products});
}

class LoadProductsFailure extends ProductsDisplayState {}
