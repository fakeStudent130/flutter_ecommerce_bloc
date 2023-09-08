import 'package:fic4_flutter_bloc_auth/data/localsources/auth_local_storage.dart';
import 'package:fic4_flutter_bloc_auth/data/models/request/login_model.dart';
import 'package:fic4_flutter_bloc_auth/data/models/response/profile_response_model.dart';
import 'package:fic4_flutter_bloc_auth/data/models/response/register_response_model.dart';
import 'package:http/http.dart' as http;

import '../models/request/register_model.dart';
import '../models/response/login_response_model.dart';
import 'endpoint.dart';

class AuthDatasource {
  Future<RegisterResponseModel> register(RegisterModel registerModel) async {
    final response = await http.post(
      Uri.parse(Endpoint.baseUrl + Endpoint.register),
      body: registerModel.toMap(),
    );

    final result = RegisterResponseModel.fromJson(response.body);

    return result;
  }

  Future<LoginResponseModel> login(LoginModel loginModel) async {
    final response = await http.post(
      Uri.parse(Endpoint.baseUrl + Endpoint.login),
      body: loginModel.toMap(),
    );

    final result = LoginResponseModel.fromJson(response.body);

    return result;
  }

  Future<ProfileResponseModel> getProfile() async {
    final token = await AuthLocalStorage().getToken();

    var headers = {'Authorization': 'Bearer $token'};
    final response = await http.get(
      Uri.parse(Endpoint.baseUrl + Endpoint.profile),
      headers: headers,
    );
    final result = ProfileResponseModel.fromJson(response.body);
    return result;
  }
}
