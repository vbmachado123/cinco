import 'package:cinco/shared/widget/item_word_widget.dart';
import 'package:flutter/material.dart';

class WordWidget extends StatefulWidget {
  final bool enabled;
  const WordWidget({Key? key, required this.enabled}) : super(key: key);

  @override
  State<WordWidget> createState() => _WordWidgetState();
}

class _WordWidgetState extends State<WordWidget> {
  // final bool wordEnabled = widget.enabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ItemWordWidget(letterEnabled: widget.enabled),
          ItemWordWidget(letterEnabled: widget.enabled),
          ItemWordWidget(letterEnabled: widget.enabled),
          ItemWordWidget(letterEnabled: widget.enabled),
          ItemWordWidget(letterEnabled: widget.enabled),
        ],
      ),
    );
  }
}
