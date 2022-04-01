import 'dart:ui';

import 'package:cinco/shared/model/letter_model.dart';
import 'package:flutter/material.dart';

import 'package:cinco/shared/widget/keyboard/button_keyboard_widget.dart';

import '../../../core/core.dart';

const _qwerty = [
  ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
  ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
  ['ENTER', 'Z', 'X', 'C', 'V', 'B', 'N', 'M', 'DEL'],
];

class KeyboardWidget extends StatelessWidget {
  const KeyboardWidget(
      {Key? key,
      required this.onKeyTapped,
      required this.onDeleteTapped,
      required this.letters,
      required this.onEnterTapped})
      : super(key: key);

  final void Function(String) onKeyTapped;
  final VoidCallback onDeleteTapped;
  final VoidCallback onEnterTapped;
  final Set<LetterModel> letters;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _qwerty
            .map((keyRow) => Row(
                  children: keyRow.map((letter) {
                    if (letter == 'DEL') {
                      return _KeyBoardButton.delete(onTap: onDeleteTapped);
                    } else if (letter == 'ENTER') {
                      return _KeyBoardButton.enter(onTap: onEnterTapped);
                    }
                    final letterKey = letters.firstWhere(
                      (e) => e.value == letter,
                      orElse: () => LetterModel.empty(),
                    );

                    return _KeyBoardButton(
                      letter: letter,
                      onTap: () => onKeyTapped,
                      backgroundColor: letterKey != LetterModel.empty()
                          ? letterKey.backgroundColor
                          : AppColors.grey0,
                    );
                  }).toList() as List<Widget>,
                ))
            .toList());
  }
}

class _KeyBoardButton extends StatelessWidget {
  final double height;
  final double width;
  final VoidCallback onTap;
  final Color backgroundColor;
  final String letter;

  _KeyBoardButton({
    Key? key,
    this.height = 48,
    this.width = 28,
    required this.onTap,
    required this.backgroundColor,
    required this.letter,
  }) : super(key: key);

  factory _KeyBoardButton.delete({
    required VoidCallback onTap,
  }) {
    return _KeyBoardButton(
      width: 48,
      onTap: onTap,
      backgroundColor: AppColors.grey0,
      letter: 'DEL',
    );
  }

  factory _KeyBoardButton.enter({
    required VoidCallback onTap,
  }) {
    return _KeyBoardButton(
      width: 48,
      onTap: onTap,
      backgroundColor: AppColors.grey0,
      letter: 'ENTER',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 2.0),
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: height,
            width: width,
            child: Center(
              child: Text(
                letter,
                style: AppTextStyles.h6_bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
