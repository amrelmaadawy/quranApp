import 'package:flutter/widgets.dart';
import 'package:quranapp/core/app_color.dart';

class Worships {
  final Widget text;
  final Widget icon;
  Worships({required this.text, required this.icon});
}

List<Worships> worships = [
  Worships(
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
    text: Text(
      'اذكار الصلاة',
      style: TextStyle(fontSize: 18, color: AppColor.kprimryColor,
        fontWeight: FontWeight.bold,),
    ),
    icon: Image.asset('assets/images/azkarelprayers.png'),
  ),
  Worships(
    text: Text(
      'جميع الادعيه ',
      style: TextStyle(fontSize: 18, color: AppColor.kprimryColor,
        fontWeight: FontWeight.bold,),
    ),
    icon: Image.asset('assets/images/doaa.png'),
  ),
  Worships(
    text: Text(
      'التسبيح ',
      style: TextStyle(fontSize: 18, color: AppColor.kprimryColor,
        fontWeight: FontWeight.bold,),
    ),
    icon: Image.asset('assets/images/tasbee7.png'),
  ),
  Worships(
    text: Text(
      'التقويم  ',
      style: TextStyle(fontSize: 18, color: AppColor.kprimryColor,
        fontWeight: FontWeight.bold,),
    ),
    icon: Image.asset('assets/images/calender.png'),
  ),
  Worships(
    text: Text(
      'المفضله ',
      style: TextStyle(fontSize: 18, color: AppColor.kprimryColor,
        fontWeight: FontWeight.bold,),
    ),
    icon: Image.asset('assets/images/favorite.png'),
  ),
  Worships(
    text: Text(
      'اقرب مسجد  ',
      style: TextStyle(fontSize: 18, color: AppColor.kprimryColor,
        fontWeight: FontWeight.bold,),
    ),
    icon: Image.asset('assets/images/mosque.png'),
  ),
  Worships(
    text: Text(
      'اذكار متنوعه',
      style: TextStyle(fontSize: 18, color: AppColor.kprimryColor,
        fontWeight: FontWeight.bold,),
    ),
    icon: Image.asset('assets/images/randomazkar.png'),
  ),
];
