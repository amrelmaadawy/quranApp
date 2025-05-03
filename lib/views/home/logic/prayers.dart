import 'package:flutter/material.dart';
import 'package:quranapp/core/app_color.dart';

class Prayers {
  final String name;
  final String time;
  final Widget icon;

  Prayers({required this.name, required this.icon, required this.time});
}

List<Prayers> prayers = [
  Prayers(
    name: 'العشاء',
    icon: Image.asset(
      'assets/images/isha.png',
      color: AppColor.kunselectedicon,
    ),
    time: '5',
  ),
  Prayers(
    name: 'المغرب',
    icon: Image.asset(
      'assets/images/maghrib.png',
      color: AppColor.kunselectedicon,
    ),
    time: '5',
  ),
  Prayers(
    name: 'العصر',
    icon: Image.asset(
      'assets/images/elasr.png',
      color: AppColor.kunselectedicon,
    ),
    time: '5',
  ),
  Prayers(
    name: 'الظهر',
    icon: Image.asset(
      'assets/images/dhur1.png',
      color: AppColor.kunselectedicon,
    ),
    time: '5',
  ),
  Prayers(
    name: 'الشروق',
    icon: Image.asset(
      'assets/images/sunrise.png',
      color: AppColor.kunselectedicon,
    ),
    time: '5',
  ),
  Prayers(
    name: 'الفجر',
    icon: Image.asset(
      'assets/images/fajr.png',
      color: AppColor.kunselectedicon,
    ),
    time: '5',
  ),
];
