import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezda_assesment/core/services/api_service.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});
