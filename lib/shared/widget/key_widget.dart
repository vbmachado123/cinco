import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/core.dart';
import '../../provider/game_state_provider.dart';

class KeyWidget extends ConsumerWidget {
  final String letter;

  const KeyWidget(this.letter, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget keyCap;
    double width = 50;

    if (letter == "_") {
      keyCap = Icon(
        Icons.check,
        size: 28,
        color: AppColors.correctColor,
      );
    } else if (letter == "<") {
      keyCap = Icon(
        Icons.backspace,
        size: 26,
        color: AppColors.red_error,
      );
    } else {
      width = 31;
      keyCap = Text(
        letter.toUpperCase(),
        style: AppTextStyles.h6_bold,
      );
    }

    return InkWell(
      onTap: () {
        ref.read(gameStateProvider.notifier).updateCurrentAttempt(letter);
      },
      child: Container(
        width: width,
        height: 55,
        alignment: Alignment.center,
        margin: EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.white0,
        ),
        child: Center(
          child: keyCap,
        ),
      ),
    );
  }
}
