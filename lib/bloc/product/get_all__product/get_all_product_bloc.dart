// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:fic4_flutter_bloc_auth/data/datasources/product_datasources.dart';
import 'package:fic4_flutter_bloc_auth/data/models/response/product_response_model.dart';

part 'get_all_product_event.dart';
part 'get_all_product_state.dart';

class GetAllProductBloc extends Bloc<GetAllProductEvent, GetAllProductState> {
  final ProductDatasource productDatasource;
  GetAllProductBloc(
    this.productDatasource,
  ) : super(GetAllProductInitial()) {
    on<DoGetAllProductEvent>((event, emit) async {
      try {
        emit(GetAllProductLoading());
        final result = await productDatasource.getAllProduct();
        emit(GetAllProductLoaded(listProductResponseModel: result));
      } catch (e) {
        emit(GetAllProductError(
            message: 'Get All Product Failed ${e.toString()}'));
      }
    });
  }
}
