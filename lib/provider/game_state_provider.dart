import 'dart:math';

import 'package:cinco/provider/game_settings_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repo.dart';

class GameState {
  final GameSettings settings;
  final List<String> validWords;
  final String correctWord;
  final List<String> attempts;
  final int attempted;

  GameState({
    required this.settings,
    required this.validWords,
    required this.correctWord,
    required this.attempts,
    required this.attempted,
  });

  GameState clone({
    GameSettings? settings,
    List<String>? validWords,
    String? correctWord,
    List<String>? attempts,
    int? attempted,
  }) {
    return GameState(
        settings: this.settings,
        validWords: validWords ?? this.validWords,
        correctWord: correctWord ?? this.correctWord,
        attempts: attempts ?? this.attempts,
        attempted: attempted ?? this.attempted);
  }
}

class GameStateNotifier extends StateNotifier<GameState> {
  final Random rng = Random();

  GameStateNotifier(GameSettings settings)
      : super(GameState(
            validWords: [],
            correctWord: "begin",
            settings: settings,
            attempts: [],
            attempted: 0));

  Future<void> updateWords() async {
    final words = await loadWords();
    var correctWord = words[rng.nextInt(words.length - 1)];
    print('Palavra correta: $correctWord');
    state = state.clone(validWords: words, correctWord: correctWord);
  }

  void newCorrectWord() {
    var correctWord =
        state.validWords[rng.nextInt(state.validWords.length - 1)];
    state = state.clone(correctWord: correctWord);
    print('Palavra correta: $correctWord');
  }

  void updateCurrentAttempt(String key) {
    final attempts = state.attempts;
    if (attempts.length <= state.attempted) {
      attempts.add("");
    }
    var currentAttempt = attempts[state.attempted];

    if (key == "_") {
      // handle enter press

      if (currentAttempt.length < state.settings.wordSize) {
        print("attempted word incomplete");
        return;
      }

      if (!state.validWords.contains(currentAttempt)) {
        print("not in valid words list");
        return;
      }

      state = state.clone(attempted: state.attempted + 1);
    } else if (key == "<") {
      // handle backpress
      if (currentAttempt.isEmpty) {
        print("cannot backspace on empty string");
        return;
      }
      currentAttempt = currentAttempt.substring(0, currentAttempt.length - 1);
      attempts[state.attempted] = currentAttempt;
      state = state.clone(attempts: attempts);
    } else {
      if (currentAttempt.length >= state.settings.wordSize) {
        print("trying to type word longer than correct word length");
        return;
      }
      currentAttempt += key;
      attempts[state.attempted] = currentAttempt;
      state = state.clone(attempts: attempts);
    }
  }
}

final gameStateProvider =
    StateNotifierProvider<GameStateNotifier, GameState>((ref) {
  final settings = ref.watch(gameSettingsProvider);
  final gameStateNotifier = GameStateNotifier(settings);
  gameStateNotifier.updateWords();
  return gameStateNotifier;
});
