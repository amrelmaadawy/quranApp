import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:quranapp/core/bloc_observer.dart';
import 'package:quranapp/views/home/UI/main_home_view.dart';
import 'package:quranapp/views/home/logic/locatoin_services.dart';
import 'package:quranapp/core/Services/notificatoin_service.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await LocationService.getUserLocation();
  await NotificationService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Amiri"),
      debugShowCheckedModeBanner: false,
      home: MainHomeView(),
    );
  }
}
