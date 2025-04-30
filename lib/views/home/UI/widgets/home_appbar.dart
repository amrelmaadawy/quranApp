
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              ' المكان ',
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 12,
              ),
            ),
            Text(
              'القاهره مصر',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ],
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '2025 الثلاثاء ديسمبر',
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 12,
              ),
            ),
            Text(
              '1445  الاحد ربيع الاول',
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ],
        ),
      ],
    );
  }
}
