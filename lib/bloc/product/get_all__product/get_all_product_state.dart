// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_all_product_bloc.dart';

@immutable
sealed class GetAllProductState {}

final class GetAllProductInitial extends GetAllProductState {}

class GetAllProductLoading extends GetAllProductState {}

class GetAllProductLoaded extends GetAllProductState {
  final List<ProductResponseModel> listProductResponseModel;
  GetAllProductLoaded({
    required this.listProductResponseModel,
  });
}

class GetAllProductError extends GetAllProductState {
  final String message;
  GetAllProductError({
    required this.message,
  });
}
