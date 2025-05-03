import 'package:flutter/material.dart';
import 'package:quranapp/core/app_color.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 22,
            color: AppColor.kprimryColor,
            fontWeight: FontWeight.w800,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_forward, color: AppColor.kprimryColor),
        ),
      ],
    );
  }
}
