import 'package:flutter/material.dart';
import 'package:islamic_hijri_calendar/islamic_hijri_calendar.dart';
import 'package:quranapp/core/app_color.dart';

class Calender extends StatelessWidget {
  const Calender({super.key});

  @override
  Widget build(BuildContext context) {
    return IslamicHijriCalendar(
      isHijriView:
          true, // allowing users to set either the English calendar only or display the Hijri calendar alongside the English calendar
      highlightBorder: AppColor.kprimryColor, // Set selected date border color

      adjustmentValue:
          0, // Set islamic hijri calendar adjustment value which is set  by user side
      isGoogleFont:
          true, // Set it true if you want to use google fonts else false
      fontFamilyName:
          "Lato", // Set your custom font family name or google font name

      isDisablePreviousNextMonthDates:
          true, // Set dates which are not included in current month should show disabled or enabled
    );
  }
}
