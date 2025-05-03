import 'package:flutter/material.dart';
import 'package:quranapp/core/app_color.dart';

class PrayerCard extends StatelessWidget {
  const PrayerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
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
            'الظهر',
            style: TextStyle(fontSize: 20, color: AppColor.kTextColor),
          ),
        ),
        Positioned(
          left: 40,
          bottom: 90,
          child: Text(
            '11:50',
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
            'الصلاة التالية: العصر',
            style: TextStyle(fontSize: 18, color: AppColor.kTextColor),
          ),
        ),
        Positioned(
          bottom: 25,
          left: 10,
          child: Text(
            '3:30',
            style: TextStyle(
              fontSize: 25,
              color: AppColor.kTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
