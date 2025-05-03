import 'package:flutter/material.dart';
import 'package:quranapp/core/app_color.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              ' المكان ',
              style: TextStyle(color: Colors.grey.shade700, fontSize: 15),
            ),
            Text(
              'القاهره, مصر',
              style: TextStyle(color: AppColor.kprimryColor, fontSize: 20),
            ),
          ],
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '2025 الثلاثاء ديسمبر',
              style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
            ),
            Text(
              '1445  الاحد ربيع الاول',
              style: TextStyle(color: AppColor.kprimryColor, fontSize: 18),
            ),
          ],
        ),
      ],
    );
  }
}
