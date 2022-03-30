import 'package:cinco/core/core.dart';
import 'package:cinco/page/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToolbarWidget extends PreferredSize {
  final String label;

  ToolbarWidget(this.label)
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
                        InkWell(
                            onTap: () => Get.offAll(const HomePage()),
                            child: Icon(Icons.settings,
                                size: 32, color: AppColors.primary0)),
                        Text(label, style: AppTextStyles.h6_bold_primary),
                        InkWell(
                            onTap: () => Get.offAll(const HomePage()),
                            child: Icon(Icons.info_outline,
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
