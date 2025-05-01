import 'package:flutter/material.dart';
import 'package:quranapp/views/eveningadhkar/UI/evening_adhkar.dart';
import 'package:quranapp/views/home/logic/worships.dart';
import 'package:quranapp/views/morningadhkar/UI/morning_adhkar.dart';
import 'package:quranapp/views/prayeradhkar/UI/prayer_adhkar.dart';

class AllWorshipsList extends StatelessWidget {
  const AllWorshipsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 30, 
      runSpacing: 10, 
      alignment: WrapAlignment.spaceEvenly, // Distribute space evenly
      children: [
        for (var worship in worships)
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
                  case 1:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MorningAdhkar(),
                    ),
                  );
                  case 2:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PrayerAdhkar(),
                    ),
                  );
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
