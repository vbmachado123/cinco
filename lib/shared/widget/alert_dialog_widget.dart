import 'package:cinco/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  String title = '';
  final Widget currentBody;

  AlertDialogWidget({Key? key, required this.title, required this.currentBody})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 10,
      insetAnimationCurve: Curves.easeInOutCubicEmphasized,
      insetAnimationDuration: Duration(milliseconds: 500),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row(
            //   children: [
            //     Text(
            //       title,
            //       style: AppTextStyles.h6_bold,
            //       textAlign: TextAlign.start,
            //     ),
            //   ],
            // ),
            currentBody,
          ],
        ),
      ),
    );
  }
}
