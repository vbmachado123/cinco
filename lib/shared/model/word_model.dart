import 'package:equatable/equatable.dart';

import 'package:cinco/shared/model/letter_model.dart';

class WordModel extends Equatable {
  final List<LetterModel> letters;

  WordModel({
    required this.letters,
  });

  factory WordModel.fromString(String word) => WordModel(
      letters: word.split('').map((e) => LetterModel(value: e)).toList());

  String get wordString => letters.map((e) => e.value).join();

  void addLetter(String val) {
    final currentIndex = letters.indexWhere((e) => e.value.isEmpty);
    if (currentIndex != -1) {
      letters[currentIndex] = LetterModel(value: val);
    }
  }

  void removeLetter() {
    final recentLetterIndex = letters.indexWhere((e) => e.value.isNotEmpty);
    if (recentLetterIndex != -1) {
      letters[recentLetterIndex] = LetterModel.empty();
    }
  }

  @override
  List<Object?> get props => [letters];
}
