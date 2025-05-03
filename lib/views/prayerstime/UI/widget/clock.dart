import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';
import 'package:quranapp/core/app_color.dart';

class Clock extends StatelessWidget {
  const Clock({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: AnalogClock(
        decoration: BoxDecoration(
          border: Border.all(width: 2.0, color: Colors.black),
          color: Colors.transparent,
          shape: BoxShape.circle,
        ),
        width: 150.0,
        isLive: true,
        hourHandColor: Colors.black,
        minuteHandColor: Colors.black,
        secondHandColor: AppColor.kprimryColor,
        showSecondHand: true,
        numberColor: Colors.black87,
        showNumbers: true,
        showAllNumbers: true,
        textScaleFactor: 1.4,
        showTicks: false,
        showDigitalClock: false,
      ),
    );
  }
}
