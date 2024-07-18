import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tezda_assesment/core/services/logging_service.dart';
import '../config/app_config.dart';

class ApiService {
  final String? baseUrl = AppConfig.apiBaseUrl;

  Future<void> sendRequest({
    BuildContext? context,
    required String endpoint,
    required String method,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    required Function(String) onSuccess,
    Function(String)? onClientError,
    Function(String)? onServerError,
    Function()? onNetworkError,
  }) async {
    try {
      http.Response response;
      final uri = Uri.parse('$baseUrl$endpoint');
      final defaultHeaders = {
        'Accept': 'application/json',
      };
      if (headers != null) {
        defaultHeaders.addAll(headers);
      }

      switch (method.toUpperCase()) {
        case 'GET':
          response = await http.get(uri, headers: defaultHeaders);
          break;
        case 'POST':
          response = await http.post(uri, headers: defaultHeaders, body: body);
          break;
        case 'PUT':
          response = await http.put(uri, headers: defaultHeaders, body: body);
          break;
        case 'DELETE':
          response =
              await http.delete(uri, headers: defaultHeaders, body: body);
          break;
        default:
          throw Exception('Invalid HTTP method');
      }

      Print().logInfo('''
        Request URL: $uri
        Status Code: ${response.statusCode}
        Response: ${response.body}
      ''');

      _processResponse(
        response,
        onSuccess: onSuccess,
        onClientError: onClientError,
        onServerError: onServerError,
      );
    } catch (e) {
      _handleError(e, onNetworkError: onNetworkError);
    }
  }

  void _processResponse(
    http.Response response, {
    required Function(String) onSuccess,
    Function(String)? onClientError,
    Function(String)? onServerError,
  }) {
    final statusCode = response.statusCode;
    final jsonResponse = response.body;

    if (statusCode >= 200 && statusCode < 300) {
      onSuccess(jsonResponse);
    } else if (statusCode >= 400 && statusCode < 500) {
      if (onClientError != null) {
        onClientError(jsonResponse);
      } else {
        throw Exception('Client error: ${_extractErrorMessage(jsonResponse)}');
      }
    } else if (statusCode >= 500 && statusCode < 600) {
      if (onServerError != null) {
        onServerError(jsonResponse);
      } else {
        throw Exception('Server error: ${_extractErrorMessage(jsonResponse)}');
      }
    } else {
      throw Exception('Unexpected status code: $statusCode');
    }
  }

  void _handleError(Object error, {Function()? onNetworkError}) {
    if (error is http.ClientException) {
      if (onNetworkError != null) {
        onNetworkError();
      } else {
        throw Exception('Network error: ${error.message}');
      }
    } else if (error is FormatException) {
      throw Exception('Data format error: ${error.message}');
    } else {
      throw Exception('Unknown error: $error');
    }
  }

  String _extractErrorMessage(String responseBody) {
    // Assuming the server returns a JSON with an 'error' field
    try {
      final Map<String, dynamic> json = jsonDecode(responseBody);
      if (json.containsKey('error')) {
        return json['error'];
      } else {
        return 'Unknown error occurred';
      }
    } catch (e) {
      return 'Error parsing error message';
    }
  }
}
