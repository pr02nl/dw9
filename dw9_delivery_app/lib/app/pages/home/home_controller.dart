import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dw9_delivery_app/app/repositories/products/product_repository.dart';

import 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  final ProductRepository _productRepository;
  HomeController(this._productRepository) : super(const HomeState.initial());

  Future<void> loadProducts() async {
    emit(state.copyWith(status: HomeStateStatus.loading));
    try {
      final products = await _productRepository.findAllProducts();
      emit(state.copyWith(status: HomeStateStatus.loaded, products: products));
    } catch (e, s) {
      log("Erro ao buscar produtos", error: e, stackTrace: s);
      emit(state.copyWith(
          status: HomeStateStatus.error,
          errorMessage: 'Erro ao buscar produtos'));
    }
  }
}
