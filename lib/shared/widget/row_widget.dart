import 'package:flutter/material.dart';

import 'letter_box_widget.dart';

class RowWidget extends StatelessWidget {
  final int wordSize;
  final String word;
  final String correctWord;
  final bool attempted;
  const RowWidget(
      {Key? key,
      required this.wordSize,
      required this.word,
      required this.correctWord,
      required this.attempted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<LetterBoxWidget> boxes = List.empty(growable: true);

    for (int j = 0; j < wordSize; j++) {
      var letter = "";
      if (word.length > j) {
        letter = word[j];
      }
      boxes.add(LetterBoxWidget(
        pos: j,
        letter: letter,
        attempted: attempted,
        correctWord: correctWord,
      ));
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: boxes,
    );
  }
}
