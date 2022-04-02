import 'package:flutter/material.dart';

import '../../core/core.dart';

class LetterBoxWidget extends StatelessWidget {
  final int pos;
  final String letter;
  final String correctWord;
  final bool attempted;

  const LetterBoxWidget(
      {Key? key,
      required this.pos,
      required this.letter,
      required this.correctWord,
      required this.attempted})
      : super(key: key);

  Color? getBgColor() {
    if (!attempted) return null;
    if (!correctWord.contains(letter)) return AppColors.notInWordColor;
    if (correctWord.indexOf(letter) == pos) return AppColors.correctColor;
    return AppColors.inWordColor;
  }

  BoxBorder? getBorder() {
    if (!attempted) return Border.all(color: AppColors.grey0, width: 2);
    return Border.all(color: Colors.transparent, width: 2);
  }

  Color? getTextColor() {
    if (!attempted) return AppColors.black0;
    return AppColors.white0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      alignment: Alignment.center,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: getBorder(),
        color: getBgColor(),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Text(
        letter,
        style: AppTextStyles.h6_bold,
      ),
    );
  }
}
