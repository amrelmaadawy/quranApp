import 'package:flutter/material.dart';
import 'package:quranapp/views/home/UI/widgets/all_worships_list.dart';
import 'package:quranapp/views/home/UI/widgets/home_appbar.dart';
import 'package:quranapp/views/home/UI/widgets/prayer_card.dart';
import 'package:quranapp/views/home/UI/widgets/prayers_row.dart';
import 'package:quranapp/views/home/UI/widgets/worships_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                HomeAppBar(),
                SizedBox(height: 20),
                PrayersRow(),
                SizedBox(height: 30),
                PrayerCard(),
                SizedBox(height: 20),
                WorshipsCard(),
                SizedBox(height: 30),
                AllWorshipsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
