import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quranapp/core/model/adhkar/adhkar.dart';

class GetAdhkar {
  static Future<List<Adhkar>> getAdhkar() async {
    final response = await rootBundle.loadString('Adhkar-json/adhkar.json');
    final data = json.decode(response) as List<dynamic>;
    return data.map((e) => Adhkar.fromJson(e)).toList();
  }
}
