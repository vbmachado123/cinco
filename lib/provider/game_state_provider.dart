import 'dart:math';

import 'package:cinco/page/home/home_page.dart';
import 'package:cinco/provider/game_settings_provider.dart';
import 'package:cinco/shared/widget/alert_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../core/core.dart';
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
  var correctWord = '';

  GameStateNotifier(GameSettings settings)
      : super(GameState(
            validWords: [],
            correctWord: "begin",
            settings: settings,
            attempts: [],
            attempted: 0));

  Future<void> updateWords() async {
    final words = await loadWords();
    correctWord = words[rng.nextInt(words.length - 1)].toLowerCase();

    var comAcentos = "ÄÅÁÂÀÃäáâàãÉÊËÈéêëèÍÎÏÌíîïìÖÓÔÒÕöóôòõÜÚÛüúûùÇç";
    var semAcentos = "AAAAAAaaaaaEEEEeeeeIIIIiiiiOOOOOoooooUUUuuuuCc";
    var texto = correctWord;

    for (int i = 0; i < comAcentos.length; i++) {
      if (texto.contains(comAcentos[i])) {
        texto = texto.replaceAll(comAcentos[i], semAcentos[i]);
      }
      // texto =
      //     texto.replaceAll(comAcentos[i].toString(), semAcentos[i].toString());
    }
    print('Palavra correta 2: $correctWord Palavra sem acento: $texto');
    print('Palavra correta 2: $correctWord');
    state = state.clone(validWords: words, correctWord: correctWord);
  }

  void newCorrectWord() {
    correctWord = state.validWords[rng.nextInt(state.validWords.length - 1)];

    var comAcentos = "ÄÅÁÂÀÃäáâàãÉÊËÈéêëèÍÎÏÌíîïìÖÓÔÒÕöóôòõÜÚÛüúûùÇç";
    var semAcentos = "AAAAAAaaaaaEEEEeeeeIIIIiiiiOOOOOoooooUUUuuuuCc";
    var texto;
    for (int i = 0; i < comAcentos.length; i++) {
      texto = texto.replace(comAcentos[i].toString(), semAcentos[i].toString());
    }
    correctWord = texto;
    state = state.clone(correctWord: correctWord);
    print('Palavra correta 1: $correctWord');
  }

  void updateCurrentAttempt(String key) {
    final attempts = state.attempts;
    if (attempts.length <= state.attempted) {
      attempts.add("");
    }
    var currentAttempt = attempts[state.attempted];

    // Aqui onde será feita a validação dos pontos

    if (key == "_") {
      // handle enter press

      if (currentAttempt.length < state.settings.wordSize) {
        Get.snackbar(
          "Atenção",
          "A palavra está inválida",
          duration: Duration(seconds: 1),
          backgroundColor: AppColors.red_error,
          colorText: AppColors.white0,
          overlayBlur: 2,
        );
        return;
      }

      if (currentAttempt.contains(state.correctWord) ||
          state.correctWord.contains(currentAttempt)) {
        Get.dialog(
          AlertDialogWidget(
            title: 'Parabéns!',
            currentBody: Column(
              children: [
                Text(
                  'Você acertou a palavra correta!',
                  style: AppTextStyles.p_regular,
                ),
                InkWell(
                  onTap: () => {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.primary0,
                      boxShadow: [
                        AppShadows.shadow0,
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Jogar novamente',
                        style: AppTextStyles.h6_bold_white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }

      if (!state.validWords.contains(currentAttempt)) {
        // print("not in valid words list");
        Get.snackbar(
          "Atenção",
          "A palavra ainda não existe na lista do jogo.",
          duration: Duration(seconds: 1),
          backgroundColor: AppColors.notInWordColor,
          colorText: AppColors.white0,
          overlayBlur: 2,
        );
        return;
      }

      state = state.clone(attempted: state.attempted + 1);
    } else if (key == "<") {
      // handle backpress
      if (currentAttempt.isEmpty) {
        // Get.snackbar(
        //   "Erro",
        //   "Não é possível voltar mais!",
        //   duration: Duration(seconds: 1),
        //   backgroundColor: AppColors.red_error,
        //   colorText: AppColors.white0,
        //   overlayBlur: 2,
        // );
        // print("cannot backspace on empty string");
        return;
      }
      currentAttempt = currentAttempt.substring(0, currentAttempt.length - 1);
      attempts[state.attempted] = currentAttempt;
      state = state.clone(attempts: attempts);
    } else {
      if (currentAttempt.length >= state.settings.wordSize) {
        Get.snackbar(
          "Atenção",
          "Tente com uma palavra válida",
          duration: Duration(seconds: 1),
          backgroundColor: AppColors.grey0,
          colorText: AppColors.white0,
          overlayBlur: 2,
        );
        // print("trying to type word longer than correct word length");
        return;
      }

      if (attempts.length >= currentAttempt.length &&
          correctWord == currentAttempt) {
        print('Palavra correta');
        Get.dialog(
          AlertDialogWidget(
            title: 'Parabéns!',
            currentBody: Column(
              children: [
                Text(
                  'Você acertou a palavra correta!',
                  style: AppTextStyles.p_regular,
                ),
                InkWell(
                  onTap: () => {
                    Get.back(),
                    Get.offAll(HomePage()),
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.primary0,
                      boxShadow: [
                        AppShadows.shadow0,
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Jogar novamente',
                        style: AppTextStyles.h6_bold_white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
      currentAttempt += key;
      attempts[state.attempted] = currentAttempt;
      state = state.clone(attempts: attempts);
    }
  }
}

class GameSettingsNotifier extends StateNotifier<GameSettings> {
  GameSettingsNotifier() : super(GameSettings(attempts: 5, wordSize: 5));

  void updateAttempts(int attempts) {
    state = state.clone(attempts: attempts);
  }

  void updateWordsize(int wordsize) {}
}

final gameSettingsProvider =
    StateNotifierProvider<GameSettingsNotifier, GameSettings>((ref) {
  return GameSettingsNotifier();
});

final gameStateProvider =
    StateNotifierProvider<GameStateNotifier, GameState>((ref) {
  final settings = ref.watch(gameSettingsProvider);
  final gameStateNotifier = GameStateNotifier(settings);
  gameStateNotifier.updateWords();
  return gameStateNotifier;
});
