import 'package:cinco/core/app_widget.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  const providerScopedApp = ProviderScope(child: AppWidget());
  FlutterError.onError = (FlutterErrorDetails details) {};

  runApp(providerScopedApp);
}
