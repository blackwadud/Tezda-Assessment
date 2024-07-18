import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezda_assesment/core/providers/api_service_provider.dart';
import 'package:tezda_assesment/modules/authentication/data/repositories/authrepo.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return AuthRepository(apiService);
});
