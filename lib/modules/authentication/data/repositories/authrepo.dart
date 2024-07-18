import 'package:tezda_assesment/core/constants/api_endpoints.dart';
import 'package:tezda_assesment/core/services/api_service.dart';
import 'package:tezda_assesment/core/services/logging_service.dart';
import 'package:tezda_assesment/modules/authentication/data/models/login.dart';
import 'package:tezda_assesment/modules/authentication/data/models/register.dart';
import 'package:tezda_assesment/modules/authentication/data/models/user.dart';

class AuthRepository {
  final ApiService _apiService;
  Register? _registration;
  Login? _login;
  User? _user;

  AuthRepository(this._apiService);

  Future<Register?> register(
      String username, String email, String password) async {
    try {
      await _apiService.sendRequest(
        endpoint: ApiEndpoints.register,
        method: 'POST',
        body: {
          'name': username,
          'email': email,
          'password': password,
          'avatar': "https://picsum.photos/800",
        },
        onSuccess: (response) async {
          _registration = registerFromJson(response);
          return _registration;
        },
        onNetworkError: () {
          Print().logError('Please check your internet connection!');
        },
        onClientError: (response) {
          Print().logError('Client error: $response');
        },
        onServerError: (response) {
          Print().logError('Server error: $response');
        },
      );
    } catch (e) {
      rethrow;
    }
    return _registration;
  }

  Future<Login?> login(String email, String password) async {
    try {
      await _apiService.sendRequest(
        endpoint: ApiEndpoints.login,
        method: 'POST',
        body: {
          'email': email,
          'password': password,
        },
        onSuccess: (response) async {
          _login = loginFromJson(response);
          return _login;
        },
        onNetworkError: () {
          Print().logError('Please check your internet connection!');
        },
        onClientError: (response) {
          Print().logError('Client error: $response');
        },
        onServerError: (response) {
          Print().logError('Server error: $response');
        },
      );
    } catch (e) {
      rethrow;
    }
    return _login;
  }

  Future<User?> currentUser(String accession) async {
    try {
      await _apiService.sendRequest(
        endpoint: ApiEndpoints.currentuser,
        method: 'GET',
        headers: {'Authorization': "Bearer $accession"},
        onSuccess: (response) async {
          _user = userFromJson(response);
          return _user;
        },
        onNetworkError: () {
          Print().logError('Please check your internet connection!');
        },
        onClientError: (response) {
          Print().logError('Client error: $response');
        },
        onServerError: (response) {
          Print().logError('Server error: $response');
        },
      );
    } catch (e) {
      rethrow;
    }
    return _user;
  }
}
