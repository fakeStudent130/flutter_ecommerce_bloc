import 'package:bloc/bloc.dart';
import 'package:fic4_flutter_bloc_auth/data/datasources/auth_datasources.dart';
import 'package:fic4_flutter_bloc_auth/data/localsources/auth_local_storage.dart';
import 'package:fic4_flutter_bloc_auth/data/models/request/login_model.dart';
import 'package:fic4_flutter_bloc_auth/data/models/response/login_response_model.dart';
import 'package:flutter/widgets.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthDatasource authDatasource;
  LoginBloc(this.authDatasource) : super(LoginInitial()) {
    on<DoLoginEvent>((event, emit) async {
      try {
        emit(LoginLoading());
        final result = await authDatasource.login(event.loginModel);
        await AuthLocalStorage().saveToken(result.accessToken!);
        emit(LoginLoaded(loginResponseModel: result));
      } catch (e) {
        emit(LoginError(message: 'Network Problem ${e.toString()}'));
      }
    });
  }
}
