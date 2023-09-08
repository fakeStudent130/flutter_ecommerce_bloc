// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_product_bloc.dart';

@immutable
sealed class CreateProductState {}

final class CreateProductInitial extends CreateProductState {}

class CreateProductLoading extends CreateProductState {}

class CreateProductLoaded extends CreateProductState {
  final ProductResponseModel productResponseModel;
  CreateProductLoaded({
    required this.productResponseModel,
  });
}

class CreateProductError extends CreateProductState {
  final String message;
  CreateProductError({
    required this.message,
  });
}
