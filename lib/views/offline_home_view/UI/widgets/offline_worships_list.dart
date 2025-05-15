import 'package:flutter/material.dart';
import 'package:quranapp/views/eveningadhkar/UI/morning_evening_adhkar.dart';
import 'package:quranapp/views/hijricalendar/UI/hijri_calendar.dart';
import 'package:quranapp/views/miscellaneous_adhkar/UI/miscellaneous_adhkar.dart';
import 'package:quranapp/views/offline_home_view/logic/offline_worships_class.dart';
import 'package:quranapp/views/sleep_adhkar/UI/sleep_adhkar.dart';

class OfflineWorshipsList extends StatelessWidget {
  const OfflineWorshipsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 30,
      runSpacing: 10,
      alignment: WrapAlignment.spaceEvenly,
      children: [
        for (var worship in offlineWorships)
          GestureDetector(
            onTap: () {
              switch (worship.id) {
                case 0:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EveningAdhkar(),
                    ),
                  );
                  break;

                case 2:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SleepAdhkar(),
                    ),
                  );
                  break;
                case 8:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MiscellaneousAdhkar(),
                    ),
                  );
                  break;
                case 5:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HijriCalendar(),
                    ),
                  );
                  break;
              }
            },
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 100, // Set minimum width
                maxWidth: 100, // Set maximum width (equal width)
                minHeight: 70, // Optional: Set height if needed
              ),

              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize:
                      MainAxisSize.min, //Prevent column  from expanding
                  children: [
                    worship.icon,
                    worship.text, // Ensure text doesn't overflow
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
