
import 'package:flutter/material.dart';
import 'package:quranapp/views/home/logic/worships.dart';

class AllWorshipsList extends StatelessWidget {
  const AllWorshipsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 30, // Horizontal space
      runSpacing: 10, // Vertical space
      alignment:
          WrapAlignment.spaceEvenly, // Distribute space evenly
      children: [
        for (var worship in worships)
          ConstrainedBox(
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
                      MainAxisSize
                          .min, //Prevent column  from expanding
                  children: [
                    worship.icon,
                    worship.text, // Ensure text doesn't overflow
                  ],
                ),
              ),
            ),
          
      ],
    );
  }
}
