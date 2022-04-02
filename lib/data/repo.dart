import 'dart:convert';

import 'package:flutter/services.dart';

Future<List<String>> loadWords() async {
  final data = await rootBundle.loadString('assets/words_list.json');

  return (jsonDecode(data) as List<dynamic>).cast<String>();
}
