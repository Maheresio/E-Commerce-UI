import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/utils/service_locator.dart';
import 'package:e_commerce_app/features/home/model/product_model.dart';
import 'package:e_commerce_app/features/home/repo/home_repo_imp.dart';
import 'package:meta/meta.dart';

part 'new_products_state.dart';

class NewProductsCubit extends Cubit<NewProductsState> {
  NewProductsCubit() : super(NewProductsInitial());

  void getNewProduct() async {
    emit(NewProductsLoading());
    try {
      final newProductsList =
          await getIt.get<HomeRepoImp>().getNewProducts().first;
      emit(NewProductsSuccess(newProductsList));
    } catch (error) {
      emit(NewProductsFailure(error.toString()));
    }
  }
}
