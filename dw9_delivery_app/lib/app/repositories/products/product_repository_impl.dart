import 'dart:developer';

import 'package:dio/dio.dart';

import './product_repository.dart';
import '../../core/exceptions/repository_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final CustomDio dio;

  ProductRepositoryImpl({required this.dio});
  @override
  Future<List<ProductModel>> findAllProducts() async {
    try {
      final result = await dio.unauth().get('/products');
      return result.data
          .map<ProductModel>((p) => ProductModel.fromMap(p))
          .toList();
    } on DioError catch (e, s) {
      log("Erro ao buscar produtos", error: e, stackTrace: s);
      throw RepositoryException(message: "Erro ao buscar produtos");
    }
  }
}
