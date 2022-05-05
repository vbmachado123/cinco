import 'package:cinco/core/core.dart';
import 'package:cinco/page/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../provider/game_state_provider.dart';
import 'alert_dialog_widget.dart';

class ToolbarWidget extends PreferredSize {
  final String label;
  final VoidCallback openDialog;

  ToolbarWidget(this.label, this.openDialog)
      : super(
          preferredSize: Size.fromHeight(90),
          child: Container(
            height: 120,
            child: Stack(
              children: [
                Container(
                  height: 120,
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SettingsButton(),

                        // Text(label, style: AppTextStyles.h6_bold_primary),
                        // assets/icone.png
                        Image.asset(
                          'assets/logo.png',
                          width: 94,
                        ),
                        InkWell(
                            onTap: () => openDialog(),
                            child: Icon(Icons.help_outline_outlined,
                                size: 32, color: AppColors.primary0)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
}

class SettingsButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameSettings = ref.watch(gameSettingsProvider);
    final gameSettingsNotifier = ref.read(gameSettingsProvider.notifier);

    void _newWord() {
      final gameState = ref.read(gameStateProvider);
      gameSettingsNotifier.updateAttempts(5);
    }

    return InkWell(
        onTap: () => _newWord(),
        child: Icon(
          Icons.settings,
          size: 32,
          color: AppColors.primary0,
        ));
  }
}
