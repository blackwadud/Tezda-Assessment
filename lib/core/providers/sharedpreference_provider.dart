import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezda_assesment/core/services/shared_preference.dart';

final sharedPreferenceServiceProvider = Provider<SharedPreferenceService>((ref) {
  return SharedPreferenceService();
});
