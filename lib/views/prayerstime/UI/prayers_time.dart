import 'package:flutter/material.dart';
import 'package:quranapp/views/home/UI/widgets/home_appbar.dart';
import 'package:quranapp/views/prayerstime/Logic/prayerlist.dart';
import 'package:quranapp/views/prayerstime/UI/widget/clock.dart';
import 'package:quranapp/views/prayerstime/UI/widget/prayers_time_appbar.dart';

class PrayersTime extends StatelessWidget {
  const PrayersTime({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              PrayersTimeAppBar(),
              SizedBox(height: 20),
              HomeAppBar(),
              SizedBox(height: 20),
              Clock(),
              SizedBox(height: 20),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Icon(Icons.volume_off),
                      const SizedBox(width: 10),
                      Text(prayers[index].time, style: TextStyle(fontSize: 15)),
                      Spacer(),
                      Text(prayers[index].name, style: TextStyle(fontSize: 20)),

                      SizedBox(width: 10),

                      prayers[index].icon,
                    ],
                  );
                },
                separatorBuilder:
                    (context, index) => const SizedBox(height: 20),
                itemCount: prayers.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
