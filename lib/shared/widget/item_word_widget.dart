import 'package:flutter/material.dart';

import '../../../core/core.dart';

class ItemWordWidget extends StatefulWidget {
  final bool letterEnabled;
  const ItemWordWidget({Key? key, required this.letterEnabled})
      : super(key: key);

  @override
  State<ItemWordWidget> createState() => _ItemWordWidgetState();
}

class _ItemWordWidgetState extends State<ItemWordWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 54,
            height: 54,
            padding: const EdgeInsets.all(2),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color:
                    widget.letterEnabled ? AppColors.white0 : AppColors.grey0,
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      AppColors.primary0,
                      AppColors.secondary0,
                      AppColors.tertiary0,
                    ]),
                boxShadow: [
                  AppShadows.shadow0,
                ]),
            child: Container(
              decoration: BoxDecoration(
                color:
                    widget.letterEnabled ? AppColors.white0 : AppColors.grey0,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
