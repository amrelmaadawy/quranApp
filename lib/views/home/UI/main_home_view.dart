import 'package:flutter/material.dart';
import 'package:quranapp/views/home/UI/home_view.dart';


class MainHomeView extends StatefulWidget {
  const MainHomeView({super.key});

  @override
  State<MainHomeView> createState() => _MainHomeViewState();
}

class _MainHomeViewState extends State<MainHomeView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeView());
  }
}
