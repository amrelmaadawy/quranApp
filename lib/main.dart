import 'package:flutter/material.dart';
import 'package:quranapp/views/home/UI/main_home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Amiri"),
      
      debugShowCheckedModeBanner: false, home: MainHomeView());
  }
}
