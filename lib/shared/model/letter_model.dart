import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/core.dart';

enum LetterStatus { initial, notInWord, inWord, correct }

class LetterModel extends Equatable {
  String value;
  final LetterStatus status;

  Color get backgroundColor {
    switch (status) {
      case LetterStatus.initial:
        return AppColors.grey0;
      case LetterStatus.notInWord:
        return AppColors.notInWordColor;
      case LetterStatus.inWord:
        return AppColors.inWordColor;
      case LetterStatus.correct:
        return AppColors.correctColor;
    }
  }

  Color get borderColor {
    switch (status) {
      case LetterStatus.initial:
        return AppColors.grey0;
      default:
        return Colors.transparent;
    }
  }

  factory LetterModel.empty() => LetterModel(value: '');

  LetterModel({
    required this.value,
    this.status = LetterStatus.initial,
  });

  LetterModel copyWith({
    String? value,
    LetterStatus? status,
  }) =>
      LetterModel(
        value: value ?? this.value,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [value, status];
}
