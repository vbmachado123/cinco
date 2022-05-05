import 'package:cinco/provider/game_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'row_widget.dart';

class GridWidget extends ConsumerWidget {
  const GridWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameSettings = ref.watch(gameSettingsProvider);
    final gameState = ref.watch(gameStateProvider);

    final wordSize = 5;
    final List<RowWidget> rows = List.empty(growable: true);
    for (int i = 0; i < gameSettings.attempts; i++) {
      var word = "";
      if (gameState.attempts.length > i) {
        word = gameState.attempts[i];
      }

      var attempted = false;
      if (gameState.attempted > i) {
        attempted = true;
      }
      rows.add(RowWidget(
        wordSize: wordSize,
        correctWord: gameState.correctWord,
        word: word,
        attempted: attempted,
      ));
    }

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: rows,
      ),
    );
  }
}
