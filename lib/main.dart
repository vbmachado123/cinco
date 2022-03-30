import 'package:cinco/core/app_widget.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DevicePreview(
    builder: (_) => AppWidget(),
    enabled: false,
  ));
}
