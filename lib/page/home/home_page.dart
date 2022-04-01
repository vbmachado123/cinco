import 'dart:math';

import 'package:cinco/shared/model/letter_model.dart';
import 'package:cinco/shared/model/word_model.dart';
import 'package:cinco/shared/widget/alert_dialog_widget.dart';
import 'package:cinco/shared/widget/word/item_word_widget.dart';
import 'package:cinco/shared/widget/keyboard/keyboard_widget.dart';
import 'package:cinco/shared/widget/toolbar_widget.dart';
import 'package:cinco/shared/widget/word/word_widget.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import '../../shared/widget/board_widget.dart';
import '../../shared/widget/keyboard/button_keyboard_widget.dart';
import '../../shared/widget/words_list.dart' as wordsList;

enum GameStatus {
  playing,
  submitting,
  lost,
  won,
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<WordModel> _board = List.generate(
    5,
    (_) => WordModel(
        letters: List.generate(
      5,
      (_) => LetterModel.empty(),
    )),
  );

  final List<List<GlobalKey<FlipCardState>>> _flipCardKeys = List.generate(
      5, (_) => List.generate(5, (_) => GlobalKey<FlipCardState>()));

  String keyPressed = "";

  getKeyPressed() {
    print('keyPressed Home: $keyPressed');
  }

  int _currentWordIndex = 0;
  WordModel? get _currentWord =>
      _currentWordIndex < _board.length ? _board[_currentWordIndex] : null;

  WordModel _solution = WordModel.fromString(wordsList
      .getWords[Random().nextInt(wordsList.getWords.length)]
      .toUpperCase());

  initState() {
    print('==========================================================');
    print(_solution);
    print('==========================================================');
  }

  final Set<LetterModel> _keyboardLetters = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white0,
      appBar: ToolbarWidget('5INCO'),
      body: Container(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BoardWidget(board: _board, flipCardKeys: _flipCardKeys),
              Container(
                width: double.maxFinite,
                // height: Get.height * 0.3,
                decoration: BoxDecoration(
                  color: AppColors.secondary0,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Center(
                  // child: KeyboardWidget(
                  //   keyPressed: keyPressed,
                  //   getKeyPressed: getKeyPressed,
                  // ),
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 32, bottom: 64, left: 8, right: 8),
                    child: Column(
                      children: [
                        KeyboardWidget(
                          onKeyTapped: _onKeyTapped,
                          onDeleteTapped: _onDeleteTapped,
                          onEnterTapped: _onEnterTapped,
                          letters: _keyboardLetters,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  var _gameStatus = GameStatus.playing;

  void _onKeyTapped(String letter) {
    if (_gameStatus == GameStatus.playing) {
      setState(() => _currentWord?.addLetter(letter));
    }
  }

  void _onDeleteTapped() {
    if (_gameStatus == GameStatus.playing) {
      setState(() => _currentWord?.removeLetter());
    }
  }

  void _onEnterTapped() async {
    if (_gameStatus == GameStatus.playing &&
        _currentWord != null &&
        !_currentWord!.letters.contains(LetterModel.empty())) {
      _gameStatus = GameStatus.submitting;

      for (var i = 0; i < _currentWord!.letters.length; i++) {
        final currentWordLetter = _currentWord!.letters[i];
        final currentSolutionLetter = _solution.letters[i];
        setState(() {
          if (currentWordLetter == currentSolutionLetter) {
            currentWordLetter.copyWith(status: LetterStatus.correct);
          } else if (_solution.letters.contains(currentSolutionLetter)) {
            _currentWord!.letters[i] = currentWordLetter.copyWith(
              status: LetterStatus.inWord,
            );
          } else {
            _currentWord!.letters[i] = currentWordLetter.copyWith(
              status: LetterStatus.notInWord,
            );
          }
        });

        final letter = _keyboardLetters.firstWhere(
          (e) => e.value == currentWordLetter.value,
          orElse: () => LetterModel.empty(),
        );
        if (letter.status != LetterStatus.correct) {
          _keyboardLetters
              .removeWhere((e) => e.value == currentWordLetter.value);
          _keyboardLetters.add(_currentWord!.letters[i]);
        }

        await Future.delayed(
          const Duration(milliseconds: 50),
          () => _flipCardKeys[_currentWordIndex][i].currentState?.toggleCard(),
        );
      }

      _checkIfWinOrLost();
    }
  }

  void _checkIfWinOrLost() {
    if (_currentWord!.wordString == _solution.wordString) {
      _gameStatus = GameStatus.won;
      Get.dialog(AlertDialogWidget(
          currentBody: Column(
        children: [
          Expanded(
            child: Text(
              'Parabéns!! Você ganhou!!',
              style: AppTextStyles.p_regular,
            ),
          )
        ],
      )));
    } else if (_currentWordIndex + 1 >= _board.length) {
      _gameStatus = GameStatus.lost;
      Get.dialog(AlertDialogWidget(
          currentBody: Column(
        children: [
          Expanded(
            child: Text(
              'Putsss!! Não foi dessa vez...',
              style: AppTextStyles.p_regular,
            ),
          )
        ],
      )));
    } else {
      _gameStatus = GameStatus.playing;
    }
    _currentWordIndex += 1;
  }

  void _restart() {
    setState(() {
      _gameStatus = GameStatus.playing;
      _currentWordIndex = 0;
      _board
        ..clear()
        ..addAll(List.generate(
          5,
          (_) => WordModel(
              letters: List.generate(
            5,
            (_) => LetterModel.empty(),
          )),
        ));

      _solution = WordModel.fromString(wordsList
          .getWords[Random().nextInt(wordsList.getWords.length)]
          .toUpperCase());

      _flipCardKeys
        ..clear()
        ..addAll(
          List.generate(
            5,
            (_) => List.generate(5, (_) => GlobalKey<FlipCardState>()),
          ),
        );
      _keyboardLetters.clear();
    });
  }
}
