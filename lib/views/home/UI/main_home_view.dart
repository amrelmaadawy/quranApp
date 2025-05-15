import 'package:flutter/material.dart';
import 'package:quranapp/core/Services/connection_services.dart';
import 'package:quranapp/core/app_color.dart';
import 'package:quranapp/views/home/UI/home_view.dart';
import 'package:quranapp/views/offline_home_view/UI/offline_home_view.dart';

class MainHomeView extends StatefulWidget {
  const MainHomeView({super.key});

  @override
  State<MainHomeView> createState() => _MainHomeViewState();
}

class _MainHomeViewState extends State<MainHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
        future: ConnectionServices.checkConnection(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(color: AppColor.kprimryColor),
              ),
            );
          } else if (snapshot.hasError || !snapshot.data!) {
            return OfflineHomeView();
          } else {
            return const HomeView();
          }
        },
      ),
    );
  }
}
