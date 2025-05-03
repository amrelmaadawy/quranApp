import 'package:flutter/material.dart';
import 'package:quranapp/core/app_color.dart';
import 'package:quranapp/views/home/logic/prayers.dart';

List<Prayers> prayers = [
  Prayers(
    name: 'الفجر',
    icon: Image.asset(
      'assets/images/fajr.png',
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
    name: 'الظهر',
    icon: Image.asset(
      'assets/images/dhur1.png',
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
    name: 'المغرب',
    icon: Image.asset(
      'assets/images/maghrib.png',
      color: AppColor.kunselectedicon,
    ),
    time: '5',
  ),
  Prayers(
    name: 'العشاء',
    icon: Image.asset(
      'assets/images/isha.png',
      color: AppColor.kunselectedicon,
    ),
    time: '5',
  ),
];
