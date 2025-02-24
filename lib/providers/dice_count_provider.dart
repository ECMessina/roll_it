import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:roll_it/providers/shared_preferences_provider.dart';

part 'dice_count_provider.g.dart';

@riverpod
class DiceCount extends _$DiceCount {
  @override
  int build() {
    final prefs = ref.read(sharedPreferencesProvider);
    return prefs.getInt('Saved Count') ?? 0;
  }

  void updateDiceCount(int diceCount) {
    state = diceCount;
  }
}
