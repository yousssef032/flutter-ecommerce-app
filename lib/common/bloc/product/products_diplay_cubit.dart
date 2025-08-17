import 'package:e_commerce_app/core/usecase/usecase.dart';
import 'package:e_commerce_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'products_display_state.dart';

class ProductsDisplayCubit extends Cubit<ProductsDisplayState> {
  final UseCase useCase;

  ProductsDisplayCubit({required this.useCase}) : super(ProductsLoading());

  Future<void> displayProducts(dynamic params) async {
    final returnedData = await useCase.call(params);
    returnedData.fold((error) {
      emit(LoadProductsFailure());
    }, (data) {
      emit(ProductsLoaded(products: data));
    });
  }
}
