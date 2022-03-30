import 'package:cinco/shared/widget/keyboard/button_keyboard_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';

class KeyboardWidget extends StatefulWidget {
  const KeyboardWidget({Key? key}) : super(key: key);

  @override
  State<KeyboardWidget> createState() => _KeyboardWidgetState();
}

class _KeyboardWidgetState extends State<KeyboardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 32, bottom: 64, left: 8, right: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonKeyboardWidget(
                label: "Q",
                backgroundColor: AppColors.white0,
                onPressed: () => {},
              ),
              ButtonKeyboardWidget(
                label: "W",
                backgroundColor: AppColors.white0,
                onPressed: () => {},
              ),
              ButtonKeyboardWidget(
                label: "E",
                backgroundColor: AppColors.white0,
                onPressed: () => {},
              ),
              ButtonKeyboardWidget(
                label: "R",
                backgroundColor: AppColors.white0,
                onPressed: () => {},
              ),
              ButtonKeyboardWidget(
                label: "T",
                backgroundColor: AppColors.white0,
                onPressed: () => {},
              ),
              ButtonKeyboardWidget(
                label: "Y",
                backgroundColor: AppColors.white0,
                onPressed: () => {},
              ),
              ButtonKeyboardWidget(
                label: "U",
                backgroundColor: AppColors.white0,
                onPressed: () => {},
              ),
              ButtonKeyboardWidget(
                label: "I",
                backgroundColor: AppColors.white0,
                onPressed: () => {},
              ),
              ButtonKeyboardWidget(
                label: "O",
                backgroundColor: AppColors.white0,
                onPressed: () => {},
              ),
              ButtonKeyboardWidget(
                label: "P",
                backgroundColor: AppColors.white0,
                onPressed: () => {},
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonKeyboardWidget(
                  label: "A",
                  backgroundColor: AppColors.white0,
                  onPressed: () => {},
                ),
                ButtonKeyboardWidget(
                  label: "S",
                  backgroundColor: AppColors.white0,
                  onPressed: () => {},
                ),
                ButtonKeyboardWidget(
                  label: "D",
                  backgroundColor: AppColors.white0,
                  onPressed: () => {},
                ),
                ButtonKeyboardWidget(
                  label: "F",
                  backgroundColor: AppColors.white0,
                  onPressed: () => {},
                ),
                ButtonKeyboardWidget(
                  label: "G",
                  backgroundColor: AppColors.white0,
                  onPressed: () => {},
                ),
                ButtonKeyboardWidget(
                  label: "H",
                  backgroundColor: AppColors.white0,
                  onPressed: () => {},
                ),
                ButtonKeyboardWidget(
                  label: "Q",
                  backgroundColor: AppColors.white0,
                  onPressed: () => {},
                ),
                ButtonKeyboardWidget(
                  label: "J",
                  backgroundColor: AppColors.white0,
                  onPressed: () => {},
                ),
                ButtonKeyboardWidget(
                  label: "K",
                  backgroundColor: AppColors.white0,
                  onPressed: () => {},
                ),
                ButtonKeyboardWidget(
                  label: "L",
                  backgroundColor: AppColors.white0,
                  onPressed: () => {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonKeyboardWidget(
                  label: "",
                  backgroundColor: AppColors.white0,
                  icon: Icon(
                    Icons.check,
                    color: AppColors.green,
                    size: 32,
                  ),
                  onPressed: () => {},
                ),
                ButtonKeyboardWidget(
                  label: "Z",
                  backgroundColor: AppColors.white0,
                  onPressed: () => {},
                ),
                ButtonKeyboardWidget(
                  label: "X",
                  backgroundColor: AppColors.white0,
                  onPressed: () => {},
                ),
                ButtonKeyboardWidget(
                  label: "C",
                  backgroundColor: AppColors.white0,
                  onPressed: () => {},
                ),
                ButtonKeyboardWidget(
                  label: "V",
                  backgroundColor: AppColors.white0,
                  onPressed: () => {},
                ),
                ButtonKeyboardWidget(
                  label: "B",
                  backgroundColor: AppColors.white0,
                  onPressed: () => {},
                ),
                ButtonKeyboardWidget(
                  label: "N",
                  backgroundColor: AppColors.white0,
                  onPressed: () => {},
                ),
                ButtonKeyboardWidget(
                  label: "M",
                  backgroundColor: AppColors.white0,
                  onPressed: () => {},
                ),
                ButtonKeyboardWidget(
                  label: "",
                  backgroundColor: AppColors.white0,
                  icon: Icon(
                    Icons.delete_forever,
                    size: 32,
                    color: AppColors.red_error,
                  ),
                  onPressed: () => {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
