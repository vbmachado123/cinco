import 'package:cinco/shared/widget/item_word_widget.dart';
import 'package:cinco/shared/widget/toolbar_widget.dart';
import 'package:cinco/shared/widget/word_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white0,
      appBar: ToolbarWidget('5INCO'),
      body: Container(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  WordWidget(
                    enabled: true,
                  ),
                  WordWidget(
                    enabled: false,
                  ),
                  WordWidget(
                    enabled: false,
                  ),
                  WordWidget(
                    enabled: false,
                  ),
                  WordWidget(
                    enabled: false,
                  ),
                ],
              ),
              Container(
                width: double.maxFinite,
                height: Get.height * 0.3,
                decoration: BoxDecoration(
                  color: AppColors.secondary0,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
