import 'package:cinco/core/core.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../page/home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  void _portraitModeOnly() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();

    return GetMaterialApp(
      initialRoute: '/',
      color: AppColors.primary0,
      debugShowCheckedModeBanner: false,
      builder: DevicePreview.appBuilder,
      locale: DevicePreview.locale(context),
      theme: ThemeData(
        // primarySwatch: MaterialColor(1, ),
        primarySwatch: Colors.blue,
        focusColor: AppColors.primary0,
      ),
      getPages: [
        GetPage(name: '/', page: () => const HomePage()),
      ],
    );
  }
}
