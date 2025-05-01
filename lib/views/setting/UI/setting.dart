import 'package:flutter/material.dart';
import 'package:quranapp/core/app_color.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'الاعدادات',
                  style: TextStyle(
                    fontSize: 25,
                    color: AppColor.kprimryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),
                Icon(Icons.settings, color: AppColor.kprimryColor, size: 32),
                Text('Test'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
