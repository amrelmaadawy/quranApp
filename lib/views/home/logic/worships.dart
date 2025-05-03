import 'package:flutter/widgets.dart';
import 'package:quranapp/core/app_color.dart';

class Worships {
  final Widget text;
  final Widget icon;
  final int id;
  Worships({required this.text, required this.icon, required this.id});
}

List<Worships> worships = [
  Worships(
    id: 0,
    text: Text(
      'اذكار المساء',
      style: TextStyle(
        fontSize: 18,
        color: AppColor.kprimryColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    icon: Image.asset('assets/images/azkarelmassa.png'),
  ),
  Worships(
    id: 1,
    text: Text(
      'اذكار الصباح',
      style: TextStyle(
        fontSize: 18,
        color: AppColor.kprimryColor,

        fontWeight: FontWeight.bold,
      ),
    ),
    icon: Image.asset('assets/images/azkarelsaba7.png'),
  ),
  Worships(
    id: 2,
    text: Text(
      'اذكار الصلاة',
      style: TextStyle(
        fontSize: 18,
        color: AppColor.kprimryColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    icon: Image.asset('assets/images/azkarelprayers.png'),
  ),
  Worships(
    id: 3,
    text: Text(
      'جميع الادعيه ',
      style: TextStyle(
        fontSize: 18,
        color: AppColor.kprimryColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    icon: Image.asset('assets/images/doaa.png'),
  ),
  Worships(
    id: 4,
    text: Text(
      'التسبيح ',
      style: TextStyle(
        fontSize: 18,
        color: AppColor.kprimryColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    icon: Image.asset('assets/images/tasbee7.png'),
  ),
  Worships(
    id: 5,
    text: Text(
      'التقويم  ',
      style: TextStyle(
        fontSize: 18,
        color: AppColor.kprimryColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    icon: Image.asset('assets/images/calender.png'),
  ),
  Worships(
    id: 6,
    text: Text(
      'المفضله ',
      style: TextStyle(
        fontSize: 18,
        color: AppColor.kprimryColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    icon: Image.asset('assets/images/favorite.png'),
  ),
  Worships(
    id: 7,
    text: Text(
      'اقرب مسجد  ',
      style: TextStyle(
        fontSize: 18,
        color: AppColor.kprimryColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    icon: Image.asset('assets/images/mosque.png'),
  ),
  Worships(
    id: 8,
    text: Text(
      'اذكار متنوعه',
      style: TextStyle(
        fontSize: 18,
        color: AppColor.kprimryColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    icon: Image.asset('assets/images/randomazkar.png'),
  ),
];
