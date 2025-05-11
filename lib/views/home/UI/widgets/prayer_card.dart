import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quranapp/core/app_color.dart';
import 'package:quranapp/core/pray_time_cubit/pray_time_cubit.dart';

class PrayerCard extends StatefulWidget {
  const PrayerCard({super.key});

  @override
  State<PrayerCard> createState() => _PrayerCardState();
}

class _PrayerCardState extends State<PrayerCard> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PrayTimeCubit()..getPrayTime(),
      child: BlocBuilder<PrayTimeCubit, PrayTimeState>(
        builder: (context, state) {
          final cubit = context.read<PrayTimeCubit>();
          final currentPrayer = cubit.getCurrentPrayerInfo();
          final nextPrayer = cubit.getNextPrayerInfo();

          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                width: 400,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.asset('assets/images/mosqueFrame1.png'),
                ),
              ),
              Positioned(
                left: 95,
                top: 10,
                child: Text(
                  currentPrayer['name']!.isNotEmpty
                      ? currentPrayer['name']!
                      : 'No current prayer',
                  style: TextStyle(fontSize: 20, color: AppColor.kTextColor),
                ),
              ),
              Positioned(
                left: 40,
                bottom: 90,
                child: Text(
                  currentPrayer['time']!.isNotEmpty
                      ? currentPrayer['time']!
                      : '--:--',
                  style: TextStyle(
                    fontSize: 36,
                    color: AppColor.kTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                left: 10,
                bottom: 60,
                child: Text(
                  'التالي: ${nextPrayer['name']}',
                  style: TextStyle(fontSize: 18, color: AppColor.kTextColor),
                ),
              ),
              Positioned(
                bottom: 25,
                left: 10,
                child: Text(
                  nextPrayer['time']!.isNotEmpty
                      ? nextPrayer['time']!
                      : '--:--',
                  style: TextStyle(
                    fontSize: 25,
                    color: AppColor.kTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    PrayTimeCubit().close();
    super.dispose();
  }
}
