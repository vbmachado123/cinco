import 'package:flutter/material.dart';

import 'key_widget.dart';

class KeyboardWidget extends StatelessWidget {
  const KeyboardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var i in "qwertyuiop".split("")) KeyWidget(i),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var i in "asdfghjkl".split("")) KeyWidget(i),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var i in "_zxcvbnm<".split("")) KeyWidget(i),
          ],
        ),
      ],
    );
  }
}
