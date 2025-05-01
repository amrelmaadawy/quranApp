import 'dart:convert';

import 'package:flutter/services.dart';

class GetData {
  static List<dynamic> allData = [];
  static Future<void> getData() async {
    final String response = await rootBundle.loadString(
      'Adhkar-json/adhkar.json',
    );
    final data = await json.decode(response);
    allData = data['data'];
  
  }
}
