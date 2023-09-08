import 'package:bloc/bloc.dart';
import 'package:fic4_flutter_bloc_auth/data/datasources/auth_datasources.dart';
import 'package:fic4_flutter_bloc_auth/data/models/response/register_response_model.dart';
import 'package:meta/meta.dart';

import '../../data/models/request/register_model.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthDatasource datasource;

  RegisterBloc(
    this.datasource,
  ) : super(RegisterInitial()) {
    on<SaveRegisterEvent>((event, emit) async {
      emit(RegisterLoading());
      final result = await datasource.register(event.request);
      print(result);
      emit(RegisterLoaded(model: result));
    });
  }
}
