
import 'package:flutter/material.dart';
import 'package:quranapp/core/app_color.dart';

class PrayersTimeAppBar extends StatelessWidget {
  const PrayersTimeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text('وقت الصلاة',style: TextStyle(fontSize: 25,color: AppColor.kprimryColor,fontWeight: FontWeight.bold),),
      SizedBox(width: 15,),
      SizedBox(
    child: Image.asset('assets/images/clock.png',color: AppColor.kprimryColor,width: 30,))
    ],);
  }
}