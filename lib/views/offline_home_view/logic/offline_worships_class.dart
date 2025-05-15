import 'package:flutter/widgets.dart';
import 'package:quranapp/core/app_color.dart';

class OfflineWorshipsClass {
  final Widget text;
  final Widget icon;
  final int id;
  OfflineWorshipsClass({required this.text, required this.icon, required this.id});
}

List<OfflineWorshipsClass> offlineWorships = [
  OfflineWorshipsClass(
    id: 0,
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

  OfflineWorshipsClass(
    id: 2,
    text: Text(
      'اذكار قبل النوم',
      style: TextStyle(
        fontSize: 18,
        color: AppColor.kprimryColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    icon: Image.asset('assets/images/azkarelmassa.png'),
  ),
  OfflineWorshipsClass(
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
