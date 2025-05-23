import 'package:flutter/material.dart';

import 'package:quranapp/core/components/custom_appbar_worships.dart';
import 'package:quranapp/views/hijricalendar/UI/widgets/calender.dart';

class HijriCalendar extends StatelessWidget {
  const HijriCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [CustomAppBar(title: 'التقويم'), Calender()],
            ),
          ),
        ),
      ),
    );
  }
}
