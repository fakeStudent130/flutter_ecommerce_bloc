import 'dart:convert';

import 'package:fic4_flutter_bloc_auth/data/models/request/product_model.dart';

import '../models/response/product_response_model.dart';
import 'package:http/http.dart' as http;

class ProductDatasource {
  Future<ProductResponseModel> createProduct(ProductModel model) async {
    final response = await http.post(
      Uri.parse('https://api.escuelajs.co/api/v1/products/'),
      body: model.toMap(),
    );
    return ProductResponseModel.fromJson(response.body);
  }

  Future<ProductResponseModel> updateProduct(ProductModel model, int id) async {
    final response = await http.put(
      Uri.parse('https://api.escuelajs.co/api/v1/products/$id'),
      body: model.toMap(),
    );
    return ProductResponseModel.fromJson(response.body);
  }

  Future<ProductResponseModel> getProductById(int id) async {
    final response = await http.put(
      Uri.parse('https://api.escuelajs.co/api/v1/products/$id'),
    );
    return ProductResponseModel.fromJson(response.body);
  }

  Future<List<ProductResponseModel>> getAllProduct() async {
    final response = await http.put(
      Uri.parse('https://api.escuelajs.co/api/v1/products'),
    );
    final result = List<ProductResponseModel>.from(jsonDecode(response.body)
        .map((x) => ProductResponseModel.fromJson(x))).toList();
    return result;
  }
}
