import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roll_it/providers/shared_preferences_provider.dart';

final diceCountProvider = StateProvider<int>((ref) {
  final prefs = ref.read(sharedPreferencesProvider);
  return prefs.getInt('Saved Count') ?? 0;
});
