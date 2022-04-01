import 'package:flutter/material.dart';

import '../../../core/core.dart';

class ButtonKeyboardWidget extends StatefulWidget {
  final String label;
  final Icon? icon;
  final VoidCallback onPressed;
  final Color backgroundColor;
  const ButtonKeyboardWidget({
    Key? key,
    required this.label,
    this.icon,
    required this.onPressed,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  State<ButtonKeyboardWidget> createState() => _ButtonKeyboardWidgetState();
}

class _ButtonKeyboardWidgetState extends State<ButtonKeyboardWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        width: widget.label.isNotEmpty ? 32 : 48,
        height: 46,
        // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            AppShadows.shadow0,
          ],
        ),
        child: widget.label.isNotEmpty
            ? Text(widget.label.toUpperCase(), style: AppTextStyles.p_bold)
            : widget.icon,
      ),
    );
  }
}
