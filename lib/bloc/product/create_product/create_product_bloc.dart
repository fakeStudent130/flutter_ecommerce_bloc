// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:fic4_flutter_bloc_auth/data/datasources/product_datasources.dart';
import 'package:fic4_flutter_bloc_auth/data/models/request/product_model.dart';

import '../../../data/models/response/product_response_model.dart';

part 'create_product_event.dart';
part 'create_product_state.dart';

class CreateProductBloc extends Bloc<CreateProductEvent, CreateProductState> {
  final ProductDatasource productDatasource;
  CreateProductBloc(
    this.productDatasource,
  ) : super(CreateProductInitial()) {
    on<DoCreateProductEvent>((event, emit) async {
      try {
        emit(CreateProductLoading());
        final result =
            await productDatasource.createProduct(event.productModel);
        emit(CreateProductLoaded(productResponseModel: result));
      } catch (e) {
        emit(CreateProductError(
            message: 'Failed Create Product ${e.toString()}'));
      }
    });
  }
}
