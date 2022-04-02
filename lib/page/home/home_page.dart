import 'dart:math';

import 'package:cinco/shared/model/letter_model.dart';
import 'package:cinco/shared/model/word_model.dart';
import 'package:cinco/shared/widget/grid_widget.dart';
import 'package:cinco/shared/widget/keyboard_widget.dart';
import 'package:cinco/shared/widget/toolbar_widget.dart';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import '../../shared/widget/alert_dialog_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Set<LetterModel> _keyboardLetters = {};

  initState() {
    // openDialog();
  }

  openDialog() {
    Get.dialog(
      AlertDialogWidget(
        title: '',
        currentBody: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Tutorial',
              style: AppTextStyles.h4_bold_primary,
            ),
            SizedBox(height: 16),
            Text(
              'Você tem 5 tentativas para acertar a palavra de 5 letras.\n\n Após finalizar uma palavra, clique no botão ✓ para confirmar.',
              style: AppTextStyles.p_regular,
            ),
            SizedBox(height: 32),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.correctColor,
              ),
              padding: const EdgeInsets.all(8),
              child: Text(
                'As letras em verde fazem parte da palavra e estão na posição correta.',
                style: AppTextStyles.p_regular_white,
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.inWordColor,
              ),
              padding: const EdgeInsets.all(8),
              child: Text(
                'As letras em amarelo fazem parte da palavra e não estão na posição correta.',
                style: AppTextStyles.p_regular_white,
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.notInWordColor,
              ),
              padding: const EdgeInsets.all(8),
              child: Text(
                'As letras em cinza não fazem parte da palavra.',
                style: AppTextStyles.p_regular_white,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'As palavras inválidas são aquelas que ainda não estão presentes no dicionário do jogo, continue tentando!',
              style: AppTextStyles.p_regular,
            ),
            SizedBox(height: 32),
            InkWell(
              onTap: () => Get.back(),
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
                    'Ok, vamos nessa!',
                    style: AppTextStyles.h6_bold_white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/tevitto.png',
                  height: 28,
                ),

                // SvgPicture.asset(
                //   'assets/tevitto.svg',
                //   height: 32,

                // ),
                Text(
                  'V: 1.0.1 - 2022',
                  style: AppTextStyles.p_bold,
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white0,
      appBar: ToolbarWidget('5INCO', openDialog),
      body: Container(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const GridWidget(),
              Container(
                padding: const EdgeInsets.only(
                    top: 32, bottom: 64, left: 8, right: 8),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: AppColors.secondary0,
                  borderRadius: const BorderRadius.only(
                    topLeft: const Radius.circular(32),
                    topRight: const Radius.circular(32),
                  ),
                ),
                child: const Center(
                  child: KeyboardWidget(),
                ),
              ),
            ],
          )),
    );
  }
}
