import 'package:e_commerce_app/common/bloc/categories/categories_display_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/category/usecases/get_categories.dart';
import '../../../service_locator.dart';

class CategoriesDisplayCubit extends Cubit<CategoriesDisplayState> {
  CategoriesDisplayCubit() : super(CategoriesLoading());

  void displayCategories() async {
    var returnedData = await sl<GetCategories>().call();

    returnedData.fold((message) {
      emit(LoadCategoriesFailure());
    }, (data) {
      emit(CategoriesLoaded(categories: data));
    });
  }
}
