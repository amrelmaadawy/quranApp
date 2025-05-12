import 'package:flutter/material.dart';
import 'package:quranapp/core/app_color.dart';
import 'package:quranapp/views/home/UI/home_view.dart';
import 'package:quranapp/views/prayerstime/UI/prayers_time.dart';
import 'package:quranapp/views/setting/UI/setting.dart';

class MainHomeView extends StatefulWidget {
  const MainHomeView({super.key});

  @override
  State<MainHomeView> createState() => _MainHomeViewState();
}

class _MainHomeViewState extends State<MainHomeView> {
  int currentIndex = 2;
  
  

  List<Widget> pages = [Setting(), PrayersTime(), HomeView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColor.kprimryColor,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'الاعددات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: 'مواقيت الصلاة',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.mosque),
            label: 'الصفحه الرئيسيه',
          ),
        ],
      ),
    );
  }
}
