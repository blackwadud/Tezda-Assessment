import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tezda_assesment/core/services/logging_service.dart';
import 'package:tezda_assesment/modules/authentication/data/models/user.dart';
import 'package:tezda_assesment/modules/authentication/data/repositories/authrepo.dart';
import 'package:tezda_assesment/core/providers/auth_provider.dart';
import 'package:tezda_assesment/core/routes/app_pages.dart' as pages;

final authViewModelProvider = Provider<AuthViewModel>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return AuthViewModel(authRepository);
});

class AuthViewModel {
  final AuthRepository _authRepository;
  User? user;

  AuthViewModel(this._authRepository);

  Future<void> register(BuildContext context, String username, String email,
      String password) async {
    try {
      final registration =
          await _authRepository.register(username, email, password);
      if (registration != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration successful!')),
        );
        Navigator.pushNamed(context, pages.login);
      }
    } catch (e) {
      Print().logError('Registration error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration failed: $e')),
      );
    }
  }

  Future<void> login(
      BuildContext context, String email, String password) async {
    try {
      final login = await _authRepository.login(email, password);
      if (login != null) {
        // Save tokens to shared preferences
        final sharedPrefs = await SharedPreferences.getInstance();
        await sharedPrefs.setString('accessToken', login.accessToken!);
        await sharedPrefs.setString('refreshToken', login.refreshToken!);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login successful!')),
        );
        Navigator.pushNamed(context, pages.bottomNav);
      }
    } catch (e) {
      Print().logError('Login error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: $e')),
      );
    }
  }

  Future<User?> currentUser(BuildContext context) async {
    try {
      final sharedPrefs = await SharedPreferences.getInstance();
      final accessToken = sharedPrefs.getString('accessToken');

      if (accessToken != null) {
        user = await _authRepository.currentUser(accessToken);
        if (user != null) {
          Navigator.pushNamed(context, pages.bottomNav);
        } else {
          Print().logError('Failed to fetch user details. Please login again.');
          Navigator.pushNamed(context, pages.login);
        }
      } else {
        Print().logError('Access token not found. Please login.');
        Navigator.pushNamed(context, pages.login);
      }
    } catch (e) {
      Print().logError('Error fetching current user: $e');

      Navigator.pushNamed(context, pages.login);
    }
    return user;
  }
}
